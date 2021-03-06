import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';

import 'package:qr_reader/widgets/custom_nav_bar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: () {},
          )
        ],
      ),
      body: _HomePageBody(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    // Temporal leer base de datos
    final tempScan = new ScanModel(tipo: '', valor: 'https://www.google.com/');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.deleteAllScan().then( print );

    switch ( currentIndex ) {
      case 0:
        return MapasPage();
        
      case 1:
        return DireccionesPage();

      default: return MapasPage();
    }

  }
}