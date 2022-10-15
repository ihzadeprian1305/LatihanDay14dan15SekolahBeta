import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigationPage1 extends StatefulWidget {
  NavigationPage1({
    super.key,
    this.index = 0,
    this.pesan = '',
  });

  int index;
  String pesan;

  @override
  State<NavigationPage1> createState() => _NavigationPage1State();
}

class _NavigationPage1State extends State<NavigationPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Saya Dipanggil Sebanyak ${widget.index}',
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.index++;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NavigationPage2(
                        index: widget.index,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Navigation to Page 2',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.pesan,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationPage2 extends StatefulWidget {
  const NavigationPage2({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<NavigationPage2> createState() => _NavigationPage2State();
}

class _NavigationPage2State extends State<NavigationPage2> {
  @override
  String pesan = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NavigationPage3(
                        index: widget.index,
                      );
                    },
                  ),
                );
              },
              child: Text(
                'Navigation to Page 3',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  pesan = 'Saya Kembali dari Page 2';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NavigationPage1(
                          index: widget.index,
                          pesan: pesan,
                        );
                      },
                    ),
                  );
                });
              },
              child: Text(
                'Back to Page 1',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationPage3 extends StatelessWidget {
  const NavigationPage3({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NavigationPage4(
                        index: index,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Navigation to Page 4',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationPage4 extends StatelessWidget {
  const NavigationPage4({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NavigationPage1(
                        index: index,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Back to Page 1',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
