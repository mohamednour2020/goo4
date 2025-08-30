import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo4/data/cubits/popular_cubit/popular_cubit.dart';
import 'package:goo4/data/requests/popular_request.dart';
import 'package:goo4/domain/models/popular_model.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({super.key});

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> {
  @override
  void initState() {
    PopularCubit.get(context).getPopularPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular people"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: BlocBuilder<PopularCubit, PopularState>(
          builder: (context, state) {
            return state is PopularLoading
                ? Center(child: CircularProgressIndicator())
                : state is PopularError
                ? SizedBox()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            PopularCubit.get(
                                  context,
                                ).popularModel?.results?[index].name ??
                                "no name",
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount: PopularCubit.get(context).popularModel!.results!.length,
                  );
          },
        ),
      ),
    );
  }
}
