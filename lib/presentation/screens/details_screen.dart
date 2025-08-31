import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo4/app/app_fonts.dart';
import 'package:goo4/data/cubits/details_cubit/details_cubit.dart';

class DetailsScreen extends StatefulWidget {
  final num? id;

  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    DetailsCubit.get(context).getDetails(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Screen")),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return state is DetailsLoading
              ? Center(child: CircularProgressIndicator())
              : state is DetailsError
              ? SizedBox()
              : ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DetailsCubit.get(
                                context,
                              ).popularPeopleDetailsModel?.name ??
                              "",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppFonts.boldFont,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          DetailsCubit.get(
                                context,
                              ).popularPeopleDetailsModel?.biography ??
                              "",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppFonts.regularFont,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "BirthDay : ${ DetailsCubit.get(context,).popularPeopleDetailsModel?.birthday} ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppFonts.regularFont,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "DeathDay : ${ DetailsCubit.get(context,).popularPeopleDetailsModel?.deathday} ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppFonts.regularFont,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
