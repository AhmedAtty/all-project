import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text("kakaka", style: TextStyle(fontSize: 24)),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    color: Colors.greenAccent,
                    iconSize: 100),
              ],
            ),
          ),
          const Text('''
          akdnaslkdnaslkdnaskdn
          alknda;lsdnkajscn;askjc
          aslkca;lskcnasl;cnasj
          asjcna;scjnsa;kcnj;as
          akdnaslkdnaslkdnaskdn
          alknda;lsdnkajscn;askjc
          aslkca;lskcnasl;cnasj
          asjcna;scjnsa;kcnj;as
          akdnaslkdnaslkdnaskdn
          alknda;lsdnkajscn;askjc
          aslkca;lskcnasl;cnasj
          asjcna;scjnsa;kcnj;as
          akdnaslkdnaslkdnaskdn
          alknda;lsdnkajscn;askjc
          aslkca;lskcnasl;cnasj
          asjcna;scjnsa;kcnj;as
          akdnaslkdnaslkdnaskdn
          alknda;lsdnkajscn;askjc
          aslkca;lskcnasl;cnasj
          asjcna;scjnsa;kcnj;as
          akdnaslkdnaslkdnaskdn
          alknda;lsdnkajscn;askjc
          aslkca;lskcnasl;cnasj
          asjcna;scjnsa;kcnj;as''', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
