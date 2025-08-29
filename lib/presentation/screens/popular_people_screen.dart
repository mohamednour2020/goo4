import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo4/data/requests/popular_request.dart';
import 'package:goo4/domain/models/popular_model.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({super.key});

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> {
  PopularModel? popularModel = PopularModel();

  getData() async {
    popularModel = await PopularRequest.getPopularPeople();
    setState(() {

    });
  }

  @override
  void initState() {
    getData();
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
        child:  popularModel?.results == null
            ? Center(child: CircularProgressIndicator(color: Colors.teal))
            :
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        popularModel?.results?[index].name ?? "no name",
                      ),
                    ),
                  );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16);
          },
          itemCount: popularModel!.results!.length,
        ),
      ),
    );
  }
}
