import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
// ignore: unused_import
import 'package:timezone/timezone.dart' as tz;
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  DateTime _selectedDay = DateTime.now(); // Selected date
  DateTime _focusedDay = DateTime.now(); // Focused day in calendar
  final Map<DateTime, List<String>> _events = {}; // Events for specific dates
  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Colors.blue,
          ledColor: Colors.white,
        ),
      ],
    );
    tz.initializeTimeZones(); // Initialize timezone for scheduling notifications
  }

  // Function to get events for the selected day
  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  // Function to show the dialog for adding an event
  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new event', style: TextStyle(fontSize: 20)),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _eventController,
              decoration: const InputDecoration(
                hintText: 'Enter event details...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 3, // Allow multiple lines for the event description
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addEvent();
              },
              child: const Text('Save', style: TextStyle(fontSize: 16)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _eventController.clear(); // Clear the input field
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 16)),
            ),
          ],
        );
      },
    );
  }

  // Add an event for the selected day
  void _addEvent() {
    if (_eventController.text.isNotEmpty) {
      setState(() {
        if (_events[_selectedDay] != null) {
          _events[_selectedDay]?.add(_eventController.text);
        } else {
          _events[_selectedDay] = [_eventController.text];
        }
        _eventController.clear(); // Clear input field
      });
    }
  }

  // Build the calendar widget
  Widget _buildCalendar() {
    return SingleChildScrollView(
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        eventLoader: _getEventsForDay,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/afric.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(width: 10), // Spacing between logo and title
          ],
        ),
        backgroundColor: const Color(0xFF0C2939),
        centerTitle: false, // Title aligned left with logo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scrollable Calendar Widget
            SizedBox(
              height: 250, // Adjust height as needed
              child: _buildCalendar(),
            ),
            const SizedBox(height: 20),

            // Display events for the selected day
            const Text(
              'Events for the selected day:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Use Flexible for ListView
            Flexible(
              child: ListView(
                children: _getEventsForDay(_selectedDay)
                    .map(
                      (event) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          title: Text(event),
                          leading: const Icon(Icons.event),
                          tileColor: Colors.purple.shade50,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            // Floating action button to add new events
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _showAddEventDialog,
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.add, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
