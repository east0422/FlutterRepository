import 'package:flutter/material.dart';

class AsyncUpdateUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步UI更新(FutureBuilder、StreamBuilder)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FutureBuilder<String>(
              future: mockNetworkData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // 请求已结束
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // 请求失败，显示错误
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // 请求成功，显示数据
                    return Text('Contents: ${snapshot.data}');
                  }
                } else {
                  // 请求未结束，显示loading
                  return CircularProgressIndicator();
                }
              },
            ),
            StreamBuilder<int>(
              stream: counter(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('没有Stream');
                  case ConnectionState.waiting:
                    return Text('等待数据...');
                  case ConnectionState.active:
                    return Text('active: ${snapshot.data}');
                  case ConnectionState.done:
                    return Text('Stream已关闭');
                }
                return null; // unreachable
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 模拟网络请求数据耗时操作，隔3秒后返回一个字符串
Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 3), () => '我是模拟从互联网上获取的数据');
}

// 使用Stream来实现每隔一秒生成一个数字
Stream<int> counter() {
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
  // 对当前元素进行判断，不满足条件则取消监听
  stream = stream.takeWhile((i) => i < 5);
  // 跳过满足条件的。只是从Stream中获取元素时跳过，被跳过的元素依然是被执行了的，所耗费的时间依然存在，其实只是跳过了执行完的结果而已; 如果该流发出的数据事件小于count，完成之前 stream将不会发射任何事件
  stream = stream.skipWhile((i) => i == 2);
  return stream;
}