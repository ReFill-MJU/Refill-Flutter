import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';
import 'package:table_calendar/table_calendar.dart';

class PrimaryCalender extends ConsumerStatefulWidget {
  final DateTime? lastDay;
  final ValueChanged<DateTime> onDateSelected;

  PrimaryCalender({
    super.key,
    DateTime? lastDay,
    required this.onDateSelected,
  }) : lastDay = lastDay ?? DateTime.now();

  @override
  ConsumerState createState() => _PrimaryCalenderState();
}

class _PrimaryCalenderState extends ConsumerState<PrimaryCalender> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(BuildContext context) async {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDay ?? DateTime.now(),
        firstDate: DateTime.utc(2017, 01, 01),
        lastDate: DateTime.utc(2024, 08, 14),
        initialDatePickerMode: DatePickerMode.year,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );

      if (selectedDate != null) {
        setState(() {
          _selectedDay = selectedDate;
          _focusedDay = selectedDate;
        });
        widget.onDateSelected(selectedDate);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2024, 01, 01),
        lastDay: DateTime.utc(2099, 12, 31),
        locale: 'ko_KR',
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDateSelected(selectedDay); // Notify the parent widget
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        onHeaderTapped: (dateTime) => selectDate(context),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          titleCentered: true,
          titleTextStyle: RefillThemeTextStyle.title4
              .copyWith(color: RefillThemeColor.gray70),
          headerMargin: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: const BoxDecoration(
            color: RefillThemeColor.sub50,
          ),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${day.day}',
                  style: RefillThemeTextStyle.body3,
                ),
              ),
            );
          },
          selectedBuilder: (context, day, focusedDay) {
            return Container(
              decoration: const BoxDecoration(
                color: RefillThemeColor.sub50,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(6.0),
              alignment: Alignment.center,
              child: Text(
                '${day.day}',
                style: RefillThemeTextStyle.body1,
              ),
            );
          },
          todayBuilder: (context, day, focusedDay) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${day.day}',
                  style: RefillThemeTextStyle.body3,
                ),
              ),
            );
          },
          outsideBuilder: (context, day, focusedDay) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${day.day}',
                  style:
                      RefillThemeTextStyle.body7.copyWith(color: Colors.grey),
                ),
              ),
            );
          },
          dowBuilder: (context, day) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  DateFormat.E('ko_KR').format(day),
                  style: RefillThemeTextStyle.body7,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
