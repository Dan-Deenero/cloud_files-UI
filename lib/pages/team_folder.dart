import 'package:cloud_files/pages/project.dart';
import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({super.key});

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          alignment: Alignment.bottomCenter,
          height: 170,
          decoration: BoxDecoration(color: Colors.blue.shade800),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Riotters",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Team folder",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: const TextSpan(
                      text: "Storage",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: "9.1/10GB",
                          style: TextStyle(
                            color: Colors.black, 
                            fontWeight: FontWeight.w300,
                            fontSize: 16
                          )
                        )
                      ]
                  )
              ),
              const Text(
                "upgrade",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(children: [
            buildFileSizeChart("SOURCES", Colors.blue,.3),
            SizedBox(width: 2),
            buildFileSizeChart("Docs", Colors.red,.25),
            SizedBox(width: 2),
            buildFileSizeChart("IMAGES", Colors.orange,.20),
            SizedBox(width: 2),
            buildFileSizeChart("", Colors.grey[200],.23)
          ],),
        ),
        SizedBox(height: 15,),
        const Divider(
          height: 20,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(25),
            children:[
              const Text(
                "Recently Updated",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  buildFildColumn('sketch', "desktop", ".sketch"),
                  SizedBox(width: availableScreenWidth * .03,),
                  buildFildColumn('sketch', "mobile", ".sketch"),
                  SizedBox(width: availableScreenWidth * .03,),
                  buildFildColumn('prd', "interaction", ".prd"),
                ],
              ),
              Divider(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  Text(
                    "Projects",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Create new",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              buildProjectRow("Chatbox"),
              buildProjectRow("TimeNote"),
              buildProjectRow("Something"),
              buildProjectRow("Others"),
            ],
          ),
        ),
      ]),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
          ]
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child:const  Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Folder'
            ),
      ],),
    );
  }

  Widget buildProjectRow(String folderName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) => ProjectPage(folderName: folderName)
          )
        );  
      },
      child: Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon( 
                        Icons.folder,
                        color: Colors.blue[200],
                      ),
                      SizedBox(width: 12,),
                      Text(
                        folderName,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ]),
                  IconButton(
                    onPressed: () {},
                    icon: Icon( 
                        Icons.more_vert_rounded,
                        color: Colors.grey,
                      ),
                  )
                  ],
                ),
              ),
    );
  }

  Column buildFildColumn(String image, String filename, String extension) {
    return Column(
                  children: [
                    Container(
                      width: availableScreenWidth * .31,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(38),
                      height: 100,
                      child: Image.asset('assets/images/$image.png'),
                    ),
                    SizedBox(height: 15,),
                    RichText(
                      text:  TextSpan(
                        text: filename,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                              text: extension,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 12
                              )
                          )
                        ]
                      ),
                    )
                  ],
                );
  }

  Column buildFileSizeChart(String title, Color? color, double width) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: availableScreenWidth * width,
                height: 4,
                color: color,
              ),
              const SizedBox(height: 8),
              const Text(
                "SOURCES",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          );
  }
}
