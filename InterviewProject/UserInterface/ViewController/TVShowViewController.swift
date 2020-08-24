//
//  TVShowViewController.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - 视图、数据
    @IBOutlet weak var tableView: UITableView!
    let viewModel = TVShowViewModel()
    var messageModel: TVMessageModel?
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNav()
        self.setViews()
        self.reloadData()
        // Do any additional setup after loading the view.
    }
    
    /**
    *  导航栏设置
    *  @creator    Eric
    */
    func setNav() {
        self.title = "显示页面"
        
        let rightBarButtonItem = UIBarButtonItem.init(title: "历史记录", style: .done, target: self, action: #selector(rightBarButtonItemMethod))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc func rightBarButtonItemMethod() {
        let historyViewController = TVHistoryViewController()
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    /**
    *  设置界面
    *  @creator    Eric
    */
    func setViews() {
        tableView.register(UINib.init(nibName: "TVShowInfoCell", bundle: Bundle.main), forCellReuseIdentifier: TVShowInfoCell.kShowInfoCell)
    }
//    刷新时间视图
    lazy var sectionLabel : UILabel = {
        () -> UILabel in
        
        let _timeMark = UILabel()
        _timeMark.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        _timeMark.font = UIFont.boldSystemFont(ofSize: 16.0)
        _timeMark.textColor = .red
        _timeMark.textAlignment = .center
        _timeMark.text = "当前未获取到数据"
        _timeMark.backgroundColor = .white
        return _timeMark
    }()
    

    /**
    *  数据加载
    *  @creator    Eric
    */
    func reloadData() {
//        初始加载数据
        let siganle = Signal<(date: String?, messageModel: TVMessageModel?), Error>.Observer() { (messageInfo) in
            if messageInfo.value != nil {
                self.messageModel = messageInfo.value?.messageModel!
                self.sectionLabel.text = "最新更新时间：" + (messageInfo.value?.date!)!
                self.tableView.reloadData()
            }
        }
        viewModel.getFirstInfoProducer.start(siganle)

//        更新最新数据
        TVMessageManager.sharedInstance.newDataSig.observe(siganle)
    }
    
    
    
    // MARK: - UITableViewDelegate、 UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sectionLabel
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.messageModel != nil {
            return 10
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVShowInfoCell.kShowInfoCell, for: indexPath) as? TVShowInfoCell
        cell!.fillCell(withModel: self.messageModel!, indexPath: indexPath)
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
