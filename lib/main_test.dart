import 'dart:convert';

import 'package:coffea/coffee/flavor.dart';

void main() {
  final json = r'''[
{
"flavor": "Roasted",
"children": [
{
"flavor": "Pipe Tobacco"
},
{
"flavor": "Tobacco"
},
{
"flavor": "Burnt",
"children": [
{
"flavor": "Acrid"
},
{
"flavor": "Ashy"
},
{
"flavor": "Smoky"
},
{
"flavor": "Brown, Roast"
}
]
},
{
"flavor": "Cereal",
"children": [
{
"flavor": "Malt"
},
{
"flavor": "Grain"
}
]
}
]
},
{
"flavor": "Spices",
"children": [
{
"flavor": "Pungent"
},
{
"flavor": "Pepper"
},
{
"flavor": "Brown Spice",
"children": [
{
"flavor": "Anise"
},
{
"flavor": "Nutmeg"
},
{
"flavor": "Cinnamon"
},
{
"flavor": "Clove"
}
]
}
]
},
{
"flavor": "Nutty/Cocoa",
"children": [
{
"flavor": "Nutty",
"children": [
{
"flavor": "Peanuts"
},
{
"flavor": "Hazelnut"
},
{
"flavor": "Almond"
}
]
},
{
"flavor": "Cocoa",
"children": [
{
"flavor": "Chocolate"
},
{
"flavor": "Dark Chocolate"
}
]
}
]
},
{
"flavor": "Sweet",
"children": [
{
"flavor": "Brown Sugar",
"children": [
{
"flavor": "Molasses"
},
{
"flavor": "Maple Syrup"
},
{
"flavor": "Carmelized"
},
{
"flavor": "Honey"
}
]
},
{
"flavor": "Vanilla"
},
{
"flavor": "Vanillin"
},
{
"flavor": "Overall Sweet"
},
{
"flavor": "Sweet Aromatics"
}
]
},
{
"flavor": "Floral",
"children": [
{
"flavor": "Black Tea"
},
{
"flavor": "Floral",
"children": [
{
"flavor": "Chamomile"
},
{
"flavor": "Rose"
},
{
"flavor": "Jasmine"
}
]
}
]
},
{
"flavor": "Fruity",
"children": [
{
"flavor": "Berry",
"children": [
{
"flavor": "Blackberry"
},
{
"flavor": "Raspberry"
},
{
"flavor": "Blueberry"
},
{
"flavor": "Strawberry"
}
]
},
{
"flavor": "Dried Fruit",
"children": [
{
"flavor": "Raisin"
},
{
"flavor": "Prune"
}
]
},
{
"flavor": "Other Fruit",
"children": [
{
"flavor": "Coconut"
},
{
"flavor": "Cherry"
},
{
"flavor": "Pomegranate"
},
{
"flavor": "Pineapple"
},
{
"flavor": "Grape"
},
{
"flavor": "Apple"
},
{
"flavor": "Peach"
},
{
"flavor": "Pear"
}
]
},
{
"flavor": "Citrus Fruit",
"children": [
{
"flavor": "Grapefruit"
},
{
"flavor": "Orange"
},
{
"flavor": "Lemon"
},
{
"flavor": "Lime"
}
]
}
]
},
{
"flavor": "Sour/Fermented",
"children": [
{
"flavor": "Sour",
"children": [
{
"flavor": "Sour Aromatics"
},
{
"flavor": "Acetic Acid"
},
{
"flavor": "Butyric Acid"
},
{
"flavor": "Isovaleric Acid"
},
{
"flavor": "Citric Acid"
},
{
"flavor": "Malic Acid"
}
]
},
{
"flavor": "Alcohol/Fermented",
"children": [
{
"flavor": "Winey"
},
{
"flavor": "Whiskey"
},
{
"flavor": "Fermented"
},
{
"flavor": "Overripe"
}
]
}
]
},
{
"flavor": "Green/Vegetative",
"children": [
{
"flavor": "Olive Oil"
},
{
"flavor": "Raw"
},
{
"flavor": "Green/Vegetative",
"children": [
{
"flavor": "Under-Ripe"
},
{
"flavor": "Peapod"
},
{
"flavor": "Fresh"
},
{
"flavor": "Dark Green"
},
{
"flavor": "Vegetative"
},
{
"flavor": "Hay-Like"
},
{
"flavor": "Herb-Like"
}
]
},
{
"flavor": "Beany"
}
]
},
{
"flavor": "Other",
"children": [
{
"flavor": "Paper/Musty",
"children": [
{
"flavor": "Stale"
},
{
"flavor": "Cardboard"
},
{
"flavor": "Papery"
},
{
"flavor": "Woody"
},
{
"flavor": "Moldy/Damp"
},
{
"flavor": "Musty/Dusty"
},
{
"flavor": "Musty/Earthy"
},
{
"flavor": "Animalic"
},
{
"flavor": "Meaty Brothy"
},
{
"flavor": "Phenolic"
}
]
},
{
"flavor": "Chemical",
"children": [
{
"flavor": "Bitter"
},
{
"flavor": "Salty"
},
{
"flavor": "Medicinal"
},
{
"flavor": "Petroleum"
},
{
"flavor": "Skunky"
},
{
"flavor": "Rubber"
}
]
}
]
}
]''';

  final decoded = jsonDecode(json);
  print(
    List<Flavor>.from(
      decoded.map(
        (flavorJson) => Flavor.fromJson(flavorJson),
      ),
    ),
  );
}
