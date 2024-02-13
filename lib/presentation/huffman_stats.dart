import 'package:flutter/material.dart';
import 'package:huffman/presentation/huffman_table.dart';

import '../application/huffman.dart';

class HuffmanStats extends StatelessWidget {
  const HuffmanStats({Key? key, required this.huffman, required this.pushGraph})
      : super(key: key);

  final Huffman huffman;
  final Function pushGraph;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          margin: const EdgeInsets.all(9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Code: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        huffman.encoded,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Entropy: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        child: Text('${huffman.entropy.toStringAsFixed(4)}')),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Average length of code: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        child: Text('${huffman.avgLength.toStringAsFixed(4)}')),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Efficiency: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                        child:
                            Text('${huffman.efficiency.toStringAsFixed(4)}')),
                  ],
                ),
              ],
            ),
          ),
        ),
        HuffmanTable(dict: huffman.code),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () => {pushGraph()},
            child: const Text('Show Huffman tree'),
          ),
        ),
      ],
    );
  }
}
