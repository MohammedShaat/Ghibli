//
//  Film+Samples.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import Foundation
import SwiftUI

extension Film {
    static let samples = [castleInTheSky, graveOfTheFireflies, myNeighborTotoro]
    
    static let castleInTheSky = Film(
        id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
        title: "Castle in the Sky",
        originalTitle: "天空の城ラピュタ",
        originalTitleRomanised: "Tenkū no shiro Rapyuta",
        image: UIImage.urlOf("poster")!.absoluteString,
        movieBanner: UIImage.urlOf("banner")!.absoluteString,
        description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        releaseYear: 1986,
        duration: 124,
        score: 95,
        people: [
            "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9",
            "https://ghibliapi.vercel.app/people/fe93adf2-2f3a-4ec4-9f68-5422f1b87c01",
            "https://ghibliapi.vercel.app/people/3bc0b41e-3569-4d20-ae73-2da329bf0786",
            "https://ghibliapi.vercel.app/people/40c005ce-3725-4f15-8409-3e1b1b14b583",
            "https://ghibliapi.vercel.app/people/5c83c12a-62d5-4e92-8672-33ac76ae1fa0",
            "https://ghibliapi.vercel.app/people/e08880d0-6938-44f3-b179-81947e7873fc",
            "https://ghibliapi.vercel.app/people/2a1dad70-802a-459d-8cc2-4ebd8821248b"
        ],
        species: ["https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"],
        locations: ["https://ghibliapi.vercel.app/locations/"],
        vehicles: ["https://ghibliapi.vercel.app/vehicles/4e09b023-f650-4747-9ab9-eacf14540cfb"],
        url: "https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"
    )

    static let graveOfTheFireflies = Film(
        id: "12cfb892-aac0-4c5b-94af-521852e46d6a",
        title: "Grave of the Fireflies",
        originalTitle: "火垂るの墓",
        originalTitleRomanised: "Hotaru no haka",
        image: UIImage.urlOf("poster")!.absoluteString,
        movieBanner: UIImage.urlOf("banner")!.absoluteString,
        description: "In the latter part of World War II, a boy and his sister, orphaned when their mother is killed in the firebombing of Tokyo, are left to survive on their own in what remains of civilian life in Japan. The plot follows this boy and his sister as they do their best to survive in the Japanese countryside, battling hunger, prejudice, and pride in their own quiet, personal battle.",
        director: "Isao Takahata",
        producer: "Toru Hara",
        releaseYear: 1988,
        duration: 89,
        score: 97,
        people: ["https://ghibliapi.vercel.app/people/"],
        species: ["https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"],
        locations: ["https://ghibliapi.vercel.app/locations/"],
        vehicles: ["https://ghibliapi.vercel.app/vehicles/"],
        url: "https://ghibliapi.vercel.app/films/12cfb892-aac0-4c5b-94af-521852e46d6a"
    )

    static let myNeighborTotoro = Film(
        id: "58611129-2dbc-4a81-a72f-77ddfc1b1b49",
        title: "My Neighbor Totoro",
        originalTitle: "となりのトトロ",
        originalTitleRomanised: "Tonari no Totoro",
        image: UIImage.urlOf("poster")!.absoluteString,
        movieBanner: UIImage.urlOf("banner")!.absoluteString,
        description: "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
        director: "Hayao Miyazaki",
        producer: "Hayao Miyazaki",
        releaseYear: 1988,
        duration: 86,
        score: 93,
        people: [
            "https://ghibliapi.vercel.app/people/986faac6-67e3-4fb8-a9ee-bad077c2e7fe",
            "https://ghibliapi.vercel.app/people/d5df3c04-f355-4038-833c-83bd3502b6b9",
            "https://ghibliapi.vercel.app/people/3031caa8-eb1a-41c6-ab93-dd091b541e11",
            "https://ghibliapi.vercel.app/people/87b68b97-3774-495b-bf80-495a5f3e672d",
            "https://ghibliapi.vercel.app/people/d39deecb-2bd0-4770-8b45-485f26e1381f",
            "https://ghibliapi.vercel.app/people/591524bc-04fe-4e60-8d61-2425e42ffb2a",
            "https://ghibliapi.vercel.app/people/c491755a-407d-4d6e-b58a-240ec78b5061",
            "https://ghibliapi.vercel.app/people/f467e18e-3694-409f-bdb3-be891ade1106",
            "https://ghibliapi.vercel.app/people/08ffbce4-7f94-476a-95bc-76d3c3969c19",
            "https://ghibliapi.vercel.app/people/0f8ef701-b4c7-4f15-bd15-368c7fe38d0a"
        ],
        species: [
            "https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2",
            "https://ghibliapi.vercel.app/species/603428ba-8a86-4b0b-a9f1-65df6abef3d3",
            "https://ghibliapi.vercel.app/species/74b7f547-1577-4430-806c-c358c8b6bcf5"
        ],
        locations: ["https://ghibliapi.vercel.app/locations/"],
        vehicles: ["https://ghibliapi.vercel.app/vehicles/"],
        url: "https://ghibliapi.vercel.app/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49"
    )
}
