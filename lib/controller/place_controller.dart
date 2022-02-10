// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:travel_kenya/models/places.dart';

class PlaceController extends GetxController {
  List<Places> _places = [
    Places(
      title: 'Maasai Mara National Reserve',
      image: 'assets/imagehome1.jpg',
      description:
          'Maasai Mara National Reserve (also Masai Mara) is one of Africas most magnificent game reserves. Bordering Tanzania, the Mara is the northern extension of the Serengeti and forms a wildlife corridor between the two countries. Its named after the statuesque, red-cloaked Maasai people who live in the park and graze their animals here, as they have done for centuries. In their language, Mara means "mottled," perhaps a reference to the play of light and shadow from the acacia trees and cloud-studded skies on the vast grasslands.The park is famous for the Great Migration, when thousands of wildebeest, zebra, and Thomson\'s gazelle travel to and from the Serengeti, from July through October.\bIn the Mara River, throngs of hippos and crocodiles lurk. The park is also known for providing excellent predator sightings, thanks to its relatively large populations of lion, cheetah, and leopard – especially in the dry months from December through February.\bThanks to the parks altitude, the weather here is mild and gentle year-round.',
      location: 'Maasai Mara',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Wildlife', 'ADVENTURES'],
      subtitle: '',
    ),
    Places(
      title: 'Amboseli National Reserve',
      image: 'assets/imagehome2.jpg',
      description:
          'Crowned by Mount Kilimanjaro, Africa\'s highest peak, Amboseli National Reserve is one of Kenya\'s most popular tourist parks. The name "Amboseli" comes from a Maasai word meaning "salty dust," an apt description for the park\'s parched conditions. The reserve is one of the best places in Africa to view large herds of elephants up close. Other wildlife commonly spotted in the park includes big cats, such as lion and cheetah, as well as giraffe, impala, eland, waterbuck, gazelle, and more than 600 species of birds. Nature lovers can explore five different habitats here, ranging from the dried-up bed of Lake Amboseli, wetlands with sulfur springs, savannah, and woodlands. Look for the local Maasai people who live in the area around the park.',
      location: 'Amboseli',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Wildlife', 'ADVENTURES'],
      subtitle: '',
    ),
    Places(
      title: 'Tsavo National Park',
      image: 'assets/imagehome3.jpg',
      description:
          'Kenya\'s largest park, Tsavo, is sliced in two: Tsavo West and Tsavo East. Together these parks comprise four percent of the country\'s total area and encompass rivers, waterfalls, savannah, volcanic hills, a massive lava-rock plateau, and an impressive diversity of wildlife.Midway between Nairobi and Mombasa, Tsavo East is famous for photo-worthy sightings of large elephant herds rolling and bathing in red dust. The palm-fringed Galana River twists through the park, providing excellent game viewing and a lush counterpoint to the arid plains.Other highlights here include the Yatta Plateau, the world\'s longest lava flow; Mudanda Rock; and the Lugard Falls, which spill into rapids and crocodile-filled pools. Tsavo West is wetter and topographically more varied, with some of the most beautiful scenery in the northern reaches of the park. Highlights here are Mzima Springs, a series of natural springs with large populations of hippos and crocodiles; Chaimu Crater, a great spot for seeing birds of prey; and Ngulia Rhino Sanctuary. Wildlife is not as easy to see in Tsavo West because of the denser vegetation, but the beautiful scenery more than compensates.',
      location: 'Tsavo',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Wildlife', 'ADVENTURES'],
      subtitle: '',
    ),
    Places(
      title: 'Samburu, Buffalo Springs',
      image: 'assets/imagehome4.jpg',
      description:
          'On the banks of the palm-lined Ewaso Nyiro River, Samburu, Buffalo Springs, and Shaba Reserves lie in an arid region in the remote north of Kenya. Shaba National Reserve is one of two areas where George and Joy Adamson raised Elsa the lioness, made famous in the film Born Free. The wildlife in all three reserves depends on the waters of the river to survive, and many species are specially adapted to the parched conditions. These include Grevy\'s zebras; Somali ostriches; and gerenuks, the long-necked antelope that stand on two rear legs to reach the fresh shoots on upper tree limbs. A top attraction in Samburu National Reserve are the Sarara Singing Wells, local watering holes where Samburu warriors sing traditional songs while hauling water for their cattle to drink. You might also be rewarded with sightings of big cats and wild dogs.',
      location: 'Samburu',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Wildlife', 'ADVENTURES'],
      subtitle: '',
    ),
    Places(
      title: 'Lake Nakuru National Park',
      image: 'assets/imagehome5.jpg',
      description:
          'Lake Nakuru National Park, in Central Kenya, is famous for its huge flocks of pink flamingos. The birds throng on Lake Nakuru itself, one of the Rift Valley soda lakes that covers almost a third of the park\'s area. The park was established in 1961, and more than 450 species of birds have been recorded here, as well as a rich diversity of other wildlife. Lions, leopards, warthogs, waterbucks, pythons, and white rhinos are just some of the animals you might see, and the landscapes range from sweeping grasslands bordering the lake to rocky cliffs and woodland. The park also protects the largest euphorbia candelabrum forest in Africa. These tall, branching succulents are endemic to the region and provide a bold textural element to the arid landscapes.',
      location: 'Nakuru',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Wildlife', 'Scenery'],
      subtitle: '',
    ),
    Places(
      title: 'Lamu Island',
      image: 'assets/imagehome5.jpg',
      description:
          'The small island of Lamu, northeast of Mombasa, oozes old-world charm. A UNESCO World Heritage Site, Lamu Old Town is Kenya\'s oldest continually inhabited settlement, with origins dating back to the 12th century. Strolling the labyrinthine streets is one of the top things to do here. You can see the island\'s rich trading history reflected in the buildings. Architectural features from the Arab world, Europe, and India are evident, yet with a discernible Swahili technique. Intricately carved wooden doors, coral stone buildings, hidden courtyards, verandas, and rooftop patios are common features. Sightseeing here is like stepping back in time. Dhows plow the harbor, few if any motorized vehicles exist here, and donkeys still rule the streets as they have done for centuries. Most of Lamu\'s population is Muslim, and both men and women dress in traditional attire. Top attractions on the island include Lamu Museum, with displays on Swahili culture and the region\'s nautical history; Lamu Fort; and the Donkey Sanctuary. If all the history is a little too much, you can bask on one of the island\'s white-sand beaches or sip Arabic coffee in a local café.',
      location: 'Lamu',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Culture', 'Scenery'],
      subtitle: '',
    ),
    Places(
      title: 'Shela Beach',
      image: 'assets/imagehome5.jpg',
      description:
          'The small island of Lamu, northeast of Mombasa, oozes old-world charm. A UNESCO World Heritage Site, Lamu Old Town is Kenya\'s oldest continually inhabited settlement, with origins dating back to the 12th century. Strolling the labyrinthine streets is one of the top things to do here. You can see the island\'s rich trading history reflected in the buildings. Architectural features from the Arab world, Europe, and India are evident, yet with a discernible Swahili technique. Intricately carved wooden doors, coral stone buildings, hidden courtyards, verandas, and rooftop patios are common features. Sightseeing here is like stepping back in time. Dhows plow the harbor, few if any motorized vehicles exist here, and donkeys still rule the streets as they have done for centuries. Most of Lamu\'s population is Muslim, and both men and women dress in traditional attire. Top attractions on the island include Lamu Museum, with displays on Swahili culture and the region\'s nautical history; Lamu Fort; and the Donkey Sanctuary. If all the history is a little too much, you can bask on one of the island\'s white-sand beaches or sip Arabic coffee in a local café.',
      location: 'Lamu',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Beaches', 'Scenery'],
      subtitle: '',
    ),
    Places(
      title: 'Kitau Beach',
      image: 'assets/imagehome5.jpg',
      description:
          'The small island of Lamu, northeast of Mombasa, oozes old-world charm. A UNESCO World Heritage Site, Lamu Old Town is Kenya\'s oldest continually inhabited settlement, with origins dating back to the 12th century. Strolling the labyrinthine streets is one of the top things to do here. You can see the island\'s rich trading history reflected in the buildings. Architectural features from the Arab world, Europe, and India are evident, yet with a discernible Swahili technique. Intricately carved wooden doors, coral stone buildings, hidden courtyards, verandas, and rooftop patios are common features. Sightseeing here is like stepping back in time. Dhows plow the harbor, few if any motorized vehicles exist here, and donkeys still rule the streets as they have done for centuries. Most of Lamu\'s population is Muslim, and both men and women dress in traditional attire. Top attractions on the island include Lamu Museum, with displays on Swahili culture and the region\'s nautical history; Lamu Fort; and the Donkey Sanctuary. If all the history is a little too much, you can bask on one of the island\'s white-sand beaches or sip Arabic coffee in a local café.',
      location: 'Lamu',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Explore',
      category: ['Beaches', 'Scenery'],
      subtitle: '',
    ),
    //Events
    Places(
      title: 'Wildebeest Migration',
      description:
          'The great migration as it it known is the movement of a million plus wildebeest from serengeti in Tanzania northwards into the adjoining Masai Mara Reserve in Kenya. It is one of the world\'s most spectacular and thriling display of wildlife behaviour. The migration takes place every year with the animals primal instincts guiding them towards greener pastures.',
      image: 'assets/wildebeest.jpeg',
      date: '17',
      month: 'AUG',
      fulldate: '15 July - 23 August',
      time: '5am - 7pm',
      location: 'Maasai Mara',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Event',
      category: ['Wildlife', 'Adventures'],
      subtitle: '',
    ),
    Places(
      title: 'Lamu Cultural Festival',
      description:
          'Lamu\'s rich culture and preservation of traditional Swahili life is the essence of the Lamu Cultural Festival. it attracts people from far and beyond for a chance to take part in activities such as henna painting, poetry, traditional dancing, Dhow sailing, competitive Boa games and donkey races are popular',
      image: 'assets/lamu.jpeg',
      location: 'Lamu',
      date: '21',
      month: 'Nov',
      fulldate: '21 - 25 November',
      time: '1pm - 6pm',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Event',
      category: ['Culture', 'Scenery'],
      subtitle: '',
    ),

    Places(
      title: 'Lake Turkana Festival',
      description:
          'Celebrated on the shores of Lake Turkana, in Marsabit, this festival brings together the best culture and traditions of the different people that make up this region of northern Kenya. Over three days more than 14 ethnic groups present how they dress, the art they produce, their local gastronomy, their way of life and share their customs.',
      image: 'assets/turkana.jpeg',
      date: '5',
      month: 'Dec',
      fulldate: '5 - 7 December',
      time: '12pm - 12am',
      location: 'Turkana',
      imageList: [
        'assets/imagehome1.jpg',
        'assets/imagehome2.jpg',
        'assets/imagehome3.jpg'
      ],
      type: 'Event',
      category: ['Culture'],
      subtitle: '',
    )
  ];

  List<Places> get places {
    return [..._places];
  }

  List get placescategory {
    return places.map((e) => e.category).toList();
  }
  // List get placesType {
  //   return places.map((e) => e.type).toSet().toList();
  // }

  int get placesCount {
    return _places.length;
  }

  // List placesType(String title) {
  //   return _places.where((element) => element.type.contains(title)).toList();
  // }

  // List<Places> get placesType {
  //   return places.where((element) => element.type.contains(other)).toList();
  // }
}
