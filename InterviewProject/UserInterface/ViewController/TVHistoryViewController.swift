//
//  TVHistoryViewController.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - 视图、数据
    @IBOutlet weak var tableView: UITableView!
    var notifyView: TVMessageNotifyView?
    
    let viewModel = TVHistoryViewModel()
    var dataArr: [(date: String?, messageModel: TVMessageModel?)]?
    var page: Int = 0
    var refreshType: RefreshType = .StaticRefresh
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNav()
        self.setViews()
        self.bindInfo()
        self.reloadData()
        // Do any additional setup after loading the view.
    }
    // MARK: - 业务模块
    /**
    *  导航栏设置
    *  @creator    Eric
    */
    func setNav() {
        self.title = "历史记录"
    }
    
    /**
    *  设置界面
    *  @creator    Eric
    */
    func setViews() {
        tableView.register(UINib.init(nibName: "TVShowInfoCell", bundle: Bundle.main), forCellReuseIdentifier: TVShowInfoCell.kShowInfoCell)
        
        var notifyViewY: CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
        
        if (UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 812) ||
            (UIScreen.main.bounds.size.width == 414 && UIScreen.main.bounds.size.height == 896)
        {
            notifyViewY += 44
        } else {
            notifyViewY += 20
        }
        
        notifyView = TVMessageNotifyView.init(frame: CGRect.init(x: 0, y: notifyViewY, width: UIScreen.main.bounds.width, height: 0))
        self.view.addSubview(notifyView!)
    }
    
    /**
    *  数据绑定
    *  @creator    Eric
    */
    func bindInfo() {
        weak var weakSelf = self
        let siganle = Signal<[(date: String?, messageModel: TVMessageModel?)], Error>.Observer() { (messageArr) in
            if messageArr.value != nil {
                if self.refreshType == .PullUpRefresh {
                    self.dataArr?.append(contentsOf: messageArr.value!)
                } else {
                    self.dataArr = messageArr.value
                }
                
                self.tableView.reloadData()
            }
            weakSelf!.tableView.mj_header!.endRefreshing()
            weakSelf!.tableView.mj_footer!.endRefreshing()
        }
        viewModel.dataSig.observe(siganle)
    }
    
    /**
    *  数据加载
    *  @creator    Eric
    */
    func reloadData() {

//        下拉刷新
        let header = MJRefreshNormalHeader()
        header.setRefreshingTarget(self, refreshingAction: #selector(pullDownrefresh))
        header.setTitle("正在加载", for: .pulling)
        header.setTitle("加载完成", for: .refreshing)
        tableView.mj_header = header

//        上拉加载
        let footer =  MJRefreshAutoNormalFooter()
        footer.setRefreshingTarget(self, refreshingAction: #selector(pullUprefresh))
        footer.isAutomaticallyRefresh = false
        footer.isAutomaticallyChangeAlpha = true
        footer.setTitle("上拉加载", for: .idle)
        footer.setTitle("正在加载中", for: .refreshing)
        footer.setTitle("加载完成", for: .noMoreData)
        tableView.mj_footer = footer
        
//        第一次加载数据
        self.page = 0
        self.refreshType = .StaticRefresh
        viewModel.getGitHubData(page: self.page, refreshType: self.refreshType)
    }
        
    // MARK: - Action
    //下拉刷新功能
    @objc func pullDownrefresh() {
        self.page = 0
        self.refreshType = .PullDownRefresh
        viewModel.getGitHubData(page: self.page, refreshType: self.refreshType)
    }
    

    //上拉刷新功能
    @objc func pullUprefresh(){
        self.page += 1
        self.refreshType = .PullUpRefresh
        viewModel.getGitHubData(page: self.page, refreshType: self.refreshType)
    }
    
    
    // MARK: - UITableViewDelegate、 UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dataArr != nil {
            return self.dataArr!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVShowInfoCell.kShowInfoCell, for: indexPath) as? TVShowInfoCell
        cell?.fillCellWithDate(date: self.dataArr![indexPath.row].date!)
        return cell!
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
