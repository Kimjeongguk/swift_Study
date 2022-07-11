//
//  CardListViewController.swift
//  CreditCardList
//
//  Created by Jeongguk Kim on 2022/07/06.
//

import UIKit
import Kingfisher
import FirebaseDatabase
import FirebaseFirestore
import FirebaseFirestoreSwift


class CardListViewController: UITableViewController {
//    var ref: DatabaseReference! //Firebase Realtime Database
    var db = Firestore.firestore()
    
    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListCell")
        tableView.estimatedRowHeight = 80
        //실시간 데이터배이스 읽기
//        ref = Database.database(url: "https://creditcard-list-3dfb8-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
//
//        ref.observe(.value) { [weak self] snapshot in
//            guard let value = snapshot.value as? [String: [String: Any]] else { return }
//            do {
//                let jsonData = try JSONSerialization.data(withJSONObject: value)
//                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
//                let cardList = Array(cardData.values)
//                self?.creditCardList = cardList.sorted{ $0.rank < $1.rank }
//
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//
//            }catch let error {
//                print("ERROR JSON parsing \(error.localizedDescription)")
//            }
//
//        }
        //Firestore 읽기
        
        db.collection("creditCardList").addSnapshotListener { snapshot, error in
            guard let documets = snapshot?.documents else {
                print("ERROR Firestore fetching document \(String(describing: error))")
                return
            }
            
            self.creditCardList = documets.compactMap { doc -> CreditCard? in
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
                    let creditCard = try JSONDecoder().decode(CreditCard.self, from: jsonData)
                    return creditCard
                } catch let error {
                    print("ERROR JSON Parsing \(error)")
                    return nil
                }
            }.sorted { $0.rank < $1.rank}
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else { return UITableViewCell() }
        
        cell.rankLabel.text = "\(self.creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(self.creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = "\(self.creditCardList[indexPath.row].name)"
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.cardImageView.kf.setImage(with: imageURL)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else { return }
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
        
        //Option1
//        let cardID = creditCardList[indexPath.row].id
//        ref.child("Item\(cardID)/isSelected").setValue(true)
        
        //Option2
//        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] snapshot in
//            guard let self = self, let value = snapshot.value as? [String: [String: Any]], let key = value.keys.first else { return }
//
//            self.ref.child("\(key)/isSelected").setValue(true)
//
//        }
        //Firestore 쓰기
        //Option1
        let cardID = creditCardList[indexPath.row].id
//        db.collection("creditCardList").document("card\(cardID)").updateData(["isSelected" : true])
        
        //Option2
        db.collection("creditCardList").whereField("id", isEqualTo: cardID).getDocuments { snapshot, _ in
            guard let document = snapshot?.documents.first else {
                print("ERROR Firestore getching documnet")
                return
            }
            document.reference.updateData(["isSelected": true])
        }
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //실시간 데이터베이스 삭제
//            let cardID = creditCardList[indexPath.row].id
//            ref.child("Item\(cardID)").removeValue()

//            ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] snapshot in
//                guard let self = self, let value = snapshot.value as? [String: [String: Any]], let key = value.keys.first else { return }
//                self.ref.child(key).removeValue()
//            }
            
            //Firestroe 삭제
            //Option1
            
            let cardID = creditCardList[indexPath.row].id
//            db.collection("creditCardList").document("card\(cardID)").delete()
            
            
            //Option2
            db.collection("creditCardList").whereField("id", isEqualTo: cardID).getDocuments { snapshot, _ in
                guard let document = snapshot?.documents.first else {
                    print("ERROR")
                    return
                }
                document.reference.delete()
            }
        }
    }
}
