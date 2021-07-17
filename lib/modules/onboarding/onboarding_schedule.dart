import 'package:date_format/date_format.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/fake_dropdown.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_button.dart';
import 'package:dk_flutter_assignment/modules/onboarding/components/onboarding_hint.dart';
import 'package:dk_flutter_assignment/modules/onboarding/onboarding_success.dart';
import 'package:flutter/material.dart';

class OnboardingSchedule extends StatefulWidget {
  @override
  _OnboardingSchedulePageState createState() => _OnboardingSchedulePageState();
}

class _OnboardingSchedulePageState extends State<OnboardingSchedule> with SingleTickerProviderStateMixin {

  late final AnimationController animationController;

  late final Animation<double> _animation;

  String _dateText = '- Choose Date -';

  String _timeText = '- Choose Time -';

  DateTime selectedDate = new DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  bool isDateSelected = false;

  bool isTimeSelected = false;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    )..repeat();

    _animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateTime currentDate = new DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(currentDate.year),
        lastDate: DateTime(currentDate.year+10));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        this.isDateSelected = true;
        _dateText = formatDate(selectedDate, [DD,', ',dd,' ',M,' ',yyyy]);
      });
  }


  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        this.isTimeSelected = true;
        _timeText = formatDate(DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute
        ), [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4E80E8),
        appBar: AppBar(
          title: Text("Create Account"),
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 36),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ScaleTransition(
                          scale: _animation,
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white24,
                              )
                          )
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.event,
                            color: Color(0xFF4E80E8),
                          )
                      )
                    ],
                  )
                ),
                OnboardingHint(
                  key: Key('onboardingScheduleHint'),
                  title: 'Schedule Video Call',
                  subtitle: 'Choose the date and time that you prefer, we will send a link via email to make a video call on the scheduled date and time.'
                ),
                Container(
                  margin: EdgeInsets.only(top:20, bottom: 20)
                ),
                FakeDropdown(
                  key: Key('dateDropdown'),
                  formHint: _dateText,
                  formLabel: 'Date',
                  onPressedListener: () {
                    _selectDate(context);
                  },
                ),
                FakeDropdown(
                  key: Key('timeDropdown'),
                  formLabel: 'Time',
                  formHint: _timeText,
                  onPressedListener: () {
                    _selectTime(context);
                  },
                ),
                OnboardingButton(
                    key: Key('onboardingPasswordButton'),
                    text: 'Next',
                    onPressedListener: () {
                      if (this.isDateSelected && this.isTimeSelected) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return OnboardingSuccess();
                        }));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('You must choose the date and time first')
                        ));
                      }
                    }
                )
              ],
            )
        )
    );
  }
}