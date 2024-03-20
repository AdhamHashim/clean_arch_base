import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/home%20/domain/imports/domain_imports.dart';

class PlayerList extends StatelessWidget {
  final List<PlayerEntity> players;
  const PlayerList({super.key,required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          title: Text(player.firstName),
          subtitle: Text(player.position),
        );
      },
    );
  }
}
