import 'package:flutter/material.dart';
import 'package:first_project/propriedade.dart';
import 'DatabaseHelper.dart';

class PropriedadesScreen extends StatefulWidget {
  @override
  _PropriedadesScreenState createState() => _PropriedadesScreenState();
}

class _PropriedadesScreenState extends State<PropriedadesScreen> {
  List<Propriedade> _propriedades = [];

  @override
  void initState() {
    super.initState();
    _loadPropriedades();
  }

  void _loadPropriedades() async {
    final propriedades = await DatabaseHelper().getPropriedades();
    setState(() {
      _propriedades = propriedades;
    });
  }

  void _adicionarPropriedade() async {
    final nomeController = TextEditingController();
    final descricaoController = TextEditingController();
    final tipoSoloController = TextEditingController();
    Propriedade? novaPropriedade;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar nova propriedade'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextField(
                controller: tipoSoloController,
                decoration: InputDecoration(labelText: 'Tipo de solo'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                novaPropriedade = Propriedade(
                  id: null,
                  nome: nomeController.text,
                  descricao: descricaoController.text,
                  tipoSolo: tipoSoloController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );

    if (novaPropriedade != null) {
      await DatabaseHelper().savePropriedade(novaPropriedade!);
      _loadPropriedades();
    }
  }

  void _deletarPropriedade(Propriedade propriedade) async {
    if (propriedade.id != null) {
      await DatabaseHelper().deletePropriedade(propriedade.id!);
      _loadPropriedades();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content:
                Text('Não foi possível excluir a propriedade. ID inválido.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Propriedades'),
      ),
      body: _propriedades.isEmpty
          ? Center(
              child: Text('Nenhuma propriedade cadastrada'),
            )
          : ListView.builder(
              itemCount: _propriedades.length,
              itemBuilder: (BuildContext context, int index) {
                final propriedade = _propriedades[index];
                return ListTile(
                  title: Text(propriedade.nome),
                  subtitle: Text(propriedade.descricao),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deletarPropriedade(propriedade);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Adicionar propriedade'),
                    onTap: () {
                      Navigator.of(context).pop();
                      _adicionarPropriedade();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
