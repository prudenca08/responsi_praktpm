import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsi_123190005/pages/karak_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.kym-cdn.com/photos/images/original/002/116/713/a08.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Image.network(
                    "https://4.bp.blogspot.com/-vX9VK8saDHU/YZ2FEWqzBGI/AAAAAAAATA8/-1xkCdH-ERAacNJp3Ksm34kVfGsTLH2pQCLcBGAsYHQ/s256/logo%2Bgenshin%2Bimpact%2Bhd.png"),
                Expanded(child: SizedBox.shrink()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KarakList()));
                    },
                    child: Text('Karakter'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Text('Senjata'),
                  ),
                )
              ],
            )));
  }
}
