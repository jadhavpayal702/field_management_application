import 'package:flutter/material.dart';
import 'package:flutter_dpr/Modal/project_list.dart';
import 'package:flutter_dpr/View/dprScreen.dart';
import 'package:provider/provider.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<ProjectList>(context).projects;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        title: Text(
          "Projects",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: count.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "${count[index]['title']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DprScreen(project: count[index]),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: const Color.fromARGB(255, 117, 116, 116),
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: count[index]['buttonColor'],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "${count[index]['status']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 9),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: const Color.fromARGB(255, 117, 116, 116),
                          ),
                        ),

                        Text(
                          "${count[index]['date']}",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 121, 121, 121),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
