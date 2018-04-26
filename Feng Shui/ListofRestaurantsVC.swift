//
//  ListofRestaurantsVC.swift
//  Feng Shui
//
//  Created by 周纯稚 on 21/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit

class ListofRestaurantsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var restaurants = [Restaurant]()
    
    let restaurantName: [String] = ["King's Joy","Dadong Roast Duck","Lei Garden","Lao Zheng Xing","Paulaner Brauhaus - BLN","1點點 Bubble Tea","Wen Feng"]
    let restaurantDescription: [String] = ["King's Joy is close to the landmark Lama Temple, the well-decorated fine dining restaurant is inside a 'Hutong' traditional courtyard house. The vegetarian delicacies are presented as non-veg items \n\nAddress: 2 Wudaoying Hutong, Dongcheng Qu, Beijing \n\nPrice range: $$$$ Swipe below for pictures","Roast duck is a must-try Beijing and the restaurant has won numerous awards for its outstanding foods and services. It's located at 'Nanxincang', the old imperial granary to the northeast of the Forbidden City. It's the best Peking ducks in town. \n\nAddress: 1-2/F, Nanxincang International Plaza, 22A Dongsishitiao, Dongcheng District, Beijing \n\nPrice range: $$$$ Swipe below for pictures","Lei Garden was established in 1973. Here, one can enjoy a wide variety of traditional Chinese food\n\nQuoting from my Shanghainese firends, 'The must order dish is Crispy Roasted Pork'. It's a signature barbecued dish, created from pork belly roasted to order for a combination of crisp and melt-in-the mouth sensation.\n\nAddress: Century Ave, LuJiaZui, Pudong Xinqu, Shanghai","Lao Zheng Xing is known for its Braised Pork 红烧肉，Wonton, and Seasonal Stir-Fried Shrimp. The restaurant offers menu in English as well!\n\nSwipe below for pictures \n\nPrice range: $\n\nAddress: 556 Fuzhou Rd near Zhejiang Middle Rd","Travelling in Shanghai, and fancy good German sausges and beer? -- try BLN restaurant, and enjoy authentic Germany foods with live performances everynight! \n\nPrice range: $$\n\nAddress:  No. 2967 Binjiang Avenue, Pudong New Area, Shanghai","1點點 is a national famous Bubble Tea chain, wait line may be expected as how popular it is!\n\nPrice range: $\n\nAddress:  People's Middle Road 106 (Golden Eagle Shopping Center, 1st Floor)","Wen Feng is one of the best restaurants in Nantong, my home town. Hightlights: there's a park with nice view built by the restaurant, a great walk around before and after dinner.\n\nPrice range: $$\n\nAddress:No.59, Qing Nian Zhong Lu, Chongchuan Qu, Nantong"]
    let restaurantWebsite: [String] = ["Reservation at: +86 10 8404 9191","Menu at: http://www.dadongny.com/alacarte/","Website: https://www.leigarden.hk/en/","Website: www.laozhengxing-sh.com", "Website: http://www.bln-restaurants.com/paulaner/binjiang/","Tea Menu: http://www.yiddtea.com/product/", "Reservation at: +0513 85011551"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0...restaurantName.count - 1 {
            restaurants.append(Restaurant(name: restaurantName[index], description: restaurantDescription[index], website: restaurantWebsite[index]))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DineVC
        let selectedIndex = tableView.indexPathForSelectedRow!
        destination.restaurant = restaurants[selectedIndex.row]
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}


extension ListofRestaurantsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        cell.textLabel?.text = restaurants[indexPath.row].name
        return cell
    }
}
