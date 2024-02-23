import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class Manga {
  final int id;
  final String name;

  Manga({
    required this.id,
    required this.name,
  });
}

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  double rating = 0;
  double ratingSet = 0;
  List? _selectedMangas;
  late String _selectedMangasResult;

  final int _duration = 10;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _selectedMangas = [];
    _selectedMangasResult = '';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: _buildEmoji('🤩'),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _buildEmoji('😍'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildEmoji('😊'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: _buildEmoji('😎'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PannableRatingBar(
                  rate: rating,
                  onChanged: setRating,
                  onHover: updateRating,
                  spacing: 20,
                  items: List.generate(
                    5,
                    (index) => const RatingWidget(
                      selectedColor: Colors.yellow,
                      unSelectedColor: Colors.grey,
                      child: Icon(
                        Icons.star,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$ratingSet',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(_selectedMangasResult),
                ),
                MultiSelectFormField(
                  autovalidate: AutovalidateMode.disabled,
                  chipBackGroundColor: Colors.black,
                  chipLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.blue,
                  checkBoxCheckColor: Colors.white,
                  dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  title: Text(
                    "Select Manga",
                    style: TextStyle(fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                    return null;
                  },
                  dataSource: [
                    {"display": "Naruto", "value": "Naruto"},
                    {"display": "One Piece", "value": "One Piece"},
                    {"display": "Dragon Ball", "value": "Dragon Ball"},
                    {"display": "Attack on Titan", "value": "Attack on Titan"},
                    {"display": "Death Note", "value": "Death Note"},
                    {
                      "display": "My Hero Academia",
                      "value": "My Hero Academia"
                    },
                    {"display": "Demon Slayer", "value": "Demon Slayer"},
                    {"display": "Tokyo Ghoul", "value": "Tokyo Ghoul"},
                    {"display": "Bleach", "value": "Bleach"},
                    {
                      "display": "Fullmetal Alchemist",
                      "value": "Fullmetal Alchemist"
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Please choose one or more'),
                  initialValue: _selectedMangas,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedMangas = value;
                    });
                  },
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    _controller.start();
                  },
                  child: CircularCountDownTimer(
                    duration: _duration,
                    initialDuration: 0,
                    controller: _controller,
                    width: size.width / 2,
                    height: size.height / 2,
                    ringColor: Colors.grey[300]!,
                    fillColor: Colors.purpleAccent[100]!,
                    backgroundColor: Colors.purple[500],
                    strokeWidth: 20.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.S,
                    isReverse: false,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: false,
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: () {
                      debugPrint('Countdown Ended');
                    },
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == 0) {
                        return "Start";
                      } else {
                        return Function.apply(
                            defaultFormatterFunction, [duration]);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmoji(String emoji) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  void updateRating(double value) {
    setState(() {
      rating = value;
    });
  }

  void setRating(double value) {
    setState(() {
      ratingSet = value;
    });
  }
}
