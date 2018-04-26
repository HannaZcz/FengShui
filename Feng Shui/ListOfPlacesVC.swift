//
//  ListOfPlacesVC.swift
//  Feng Shui
//
//  Created by 周纯稚 on 19/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit

class ListOfPlacesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let placeName: [String] = [
        "Oriental Pearl Tower (Dongfang Mingzhu)",
        "Nanjing Road",
        "The Bund (Wai Tan)",
        "Mutianyu Great Wall",
        "Summer Palace (Yiheyuan)",
        "Sānlǐtún Taikooli & 798 Art District",
        "Forbidden City & The Palace Museum",
        "Wolf Mountain",
        "Hao River"]
    let placeAddress: [String] = [
        "Address: No.1 Century Avenue, Pudong New Area",
        "Address: Nanjing East Road, Huangpu District",
        "Address: Zhongshan East 1st Road",
        "Address: Mutianyu Road, Huairou District",
        "Address: 19 Xinjian Gongmen, Haidian District",
        "Address: No.19 Sanlitun North Road",
        "Address: No.4 Jingshanqian Street, Dongcheng District",
        "Address: No.2 Lingang Road, Langshan Town, Chongchuan District",
        "Address: No.55 Haohe West Road, Chongchuan District"]
    let placeDescriptions: [String] = [
        "Highlights: At 468m (1,535ft) tall, it's the third highest TV tower in the world. Its interesting design makes it an integral part of the famous Shanghai skyline, and a trip to the top affords fabulous views.",
        "Highlights: Nanjing Road is a famous shopping area in Shanghai, offering all kinds of shops and restaurants. In this area, you will find business people, tourists, and lot of touts trying to sell all kinds of services, from massages to fake watches. Even if you're not interested in shopping, it's worth checking out this always-bustling area to get an idea of how many people there are in Shanghai.",
        "Highlights: The Bund is Shanghai's historic riverside. The pedestrian promenade is right along the western bank of the Huangpu River and affords great street-level views of the Pudong skyscrapers and the Gothic, Beaux Arts, and Art Deco buildings on the Puxi side.",
        "Highlights: Unlike the tourist-packed Badaling Great Wall, Mutianyu remains less explored. It was build over 1,400 years ago during the Ming Dynasty.",
        "Highlights: The Summer Palace was the playground for emperors fleeing the suffocating summer torpor of the old imperial city. A marvel of design, the palace – with its huge lake and hilltop views – offers a pastoral escape into the landscapes of traditional Chinese painting.",
        "Highlights: This sleek plaza is a key nightlife zone, with many of the most popular bars, clubs and restaurants clustered in the Sānlǐtún area. The 798 Art District is the centre of the Chinese contemporary art scene. There are plenty of homegrown fashion brands.",
        "Highlights: The Unesco-listed 'Forbidden City 紫禁城' is ringed by 3.5km of scarlet citadel walls at the very heart of Běijīng. It's the largest best-preserved collection of ancient buildings, and the largest palace complex in the world. Palace Museum is a public institution established in 1925 after Puyi, the last emperor. Most Chinese people simply call it Gù Gōng 故宫.",
        "Highlights: Wolf Mountain is located in south area of Nantong. Five peaks are standing with the facing the rivers. On the mountain, there are 43 ancient architectures, 8 ancient tombs 23 inscription stones and 13 ancient caves. At the north of Wolf Mountain, there is a Lady Chapel which was an important site of the Catholicism in northern Jiangsu province.",
        "Highlights: Hao River is like a necklace around the city of Nantong, the surrounding are beautiful and peaceful. Like the Rhine River Seine in Paris, Hao River is the mother river of the city."]
    
    @IBOutlet weak var placeImages: UIImageView!
    
    var places = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...placeName.count - 1 {
            places.append(Place(name: placeName[index], placeDescription: placeDescriptions[index], address: placeAddress[index]))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // animating Images
        placeImages.animationImages = [
            UIImage(named: "map"),
            UIImage(named: "water"),
            UIImage(named: "greatwall"),
            UIImage(named: "langshan"),
            UIImage(named: "nantong")
            ] as? [UIImage]
        placeImages.animationDuration = 10
        placeImages.startAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailedPlacesVC
        let selectedIndex = tableView.indexPathForSelectedRow!
        destination.place = places[selectedIndex.row]
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


extension ListOfPlacesVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
}
