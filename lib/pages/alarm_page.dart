import 'package:duckduck/widgets/alarm/alarm_add_button.dart';
import 'package:duckduck/widgets/alarm/alarm_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/alarm.dart';
import '../providers/alarm_provider.dart';
import '../utils/colors.dart';
import '../widgets/alarm/alarm_dialog.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
    final alarmProvider = Provider.of<AlarmProvider>(context, listen: false);
    alarmProvider.fetchAlarms();
  }

  @override
  void didUpdateWidget(covariant AlarmPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    final alarmProvider = Provider.of<AlarmProvider>(context, listen: false);
    alarmProvider.fetchAlarms();
  }

  void _openEditDialog(BuildContext context, Alarm alarm) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlarmDialog(
          initialAlarm: alarm,
        );
      },
    ).then((value) {
      if (value != null && value is bool && value) {
        // Delete logic
        Provider.of<AlarmProvider>(context, listen: false)
            .deleteAlarm(alarm.id!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          'Your alarm',
          style: GoogleFonts.rubik(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: DuckDuckColors.steelBlack),
        ),
        backgroundColor: DuckDuckColors.frostWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: DuckDuckColors.steelBlack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                child: Consumer<AlarmProvider>(
                  builder: (context, provider, child) {
                    print("Alarms fetched: ${provider.alarms}");
                    if (provider.alarms.isEmpty) {
                      return const Center(child: Text('No alarms set'));
                    }
                    return ListView.builder(
                      itemCount: provider.alarms.length,
                      itemBuilder: (context, index) {
                        return AlarmCard(
                            alarm: provider.alarms[index],
                            onTapEdit: () {
                              _openEditDialog(context, provider.alarms[index]);
                            },
                            onToggle: (value) => provider.toggleAlarm(
                                provider.alarms[index], value));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const AlarmAddButton(),
            ],
          ),
        ),
      ),
    );
  }
}
