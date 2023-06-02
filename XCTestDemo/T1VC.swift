//
//  T1VC.swift
//  XCTestDemo
//
//  Created by FGZ on 2023/6/2.
//

import Foundation
import UIKit

class T1VC: UIViewController {

    var currT: UITableView?
    var nextT: UITableView?
    
    var preFrame: CGRect = .zero
    var currFrame: CGRect = .zero
    var nextFrame: CGRect = .zero
    var inset: UIEdgeInsets = .zero
    
    let dragMinMargin: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView(frame: CGRect(x: 0, y: self.view.bounds.height - dragMinMargin, width: self.view.bounds.width, height: 1))
        view.backgroundColor = .red
        self.view.addSubview(view)
        view.layer.zPosition = 100
        setupSubView()
    }
    
    func setupSubView() {
        inset = UIEdgeInsets(top: 0, left: 0, bottom: self.view.bounds.height, right: 0)
        let viewH = self.view.bounds.height
        preFrame = CGRect(x: 0, y: -viewH, width: self.view.bounds.width, height: viewH)
        
        let t1 = UITableView(frame: self.view.bounds, style: .plain)
        t1.delegate = self
        t1.dataSource = self
        self.view.addSubview(t1)
        t1.contentInset = inset
        currT = t1
        currFrame = t1.frame
        
        let t2 = UITableView(frame: self.view.bounds, style: .plain)
        t2.delegate = self
        t2.dataSource = self
        t2.isScrollEnabled = false
        t2.frame = CGRect(x: 0, y: viewH, width: self.view.bounds.width, height: viewH)
        self.view.addSubview(t2)
        nextT = t2
        nextFrame = t2.frame
        
        let v1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 10))
        v1.backgroundColor = .red
        let v2 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 10))
        v2.backgroundColor = .blue
        t1.tableFooterView = v1
        t2.tableFooterView = v2
    }
    
    func changeTable() {
        let temp = currT
        currT = nextT
        nextT = temp
        currT?.frame = currFrame
        nextT?.frame = nextFrame
        currT?.isScrollEnabled = true
        nextT?.isScrollEnabled = false
        currT?.contentInset = inset
        nextT?.contentInset = .zero
        currT?.contentOffset = .zero
        nextT?.contentOffset = .zero
        if let nextT = nextT {
            self.view.bringSubviewToFront(nextT)
        }
    }

    func repairAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.currT?.frame = self.currFrame
            self.nextT?.frame = self.nextFrame
            if let table = self.currT {
                let maxY = table.contentSize.height - table.bounds.height
                self.currT?.contentOffset = CGPoint(x: 0, y: maxY)
            }
        } completion: { completion in
        }
    }
    
    func toNextAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.currT?.frame = self.preFrame
            self.nextT?.frame = self.currFrame
        } completion: { completion in
            self.changeTable()
        }
    }
}

extension T1VC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "index: ==\(indexPath.row)"
            return cell
        }
        cell.textLabel?.text = "index: ==\(indexPath.row)"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if scrollView == currT, offsetY > 0 {
            let maxY = scrollView.contentSize.height - scrollView.bounds.height
            if offsetY >= maxY {
                let topOffset = offsetY - maxY
                let topY = nextFrame.minY - topOffset
                let fr = CGRect(x: nextFrame.minX, y: topY, width: nextFrame.width, height: nextFrame.height)
                nextT?.frame = fr
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        if scrollView == currT, offsetY > 0  {
            let maxY = scrollView.contentSize.height - scrollView.bounds.height
            let cha = offsetY - maxY
            if offsetY >= maxY {
                if cha >= dragMinMargin {
                    toNextAnimation()
                } else {
                    repairAnimation()
                }
            }
        }
    }
}
