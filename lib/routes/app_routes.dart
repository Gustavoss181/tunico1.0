import 'package:bicjr_app/views/pages/ajuda/index.dart';
import 'package:bicjr_app/views/pages/cadastro/index.dart';
import 'package:bicjr_app/views/pages/conteudos/index.dart';
import 'package:bicjr_app/views/pages/home/index.dart';
import 'package:bicjr_app/views/pages/login/index.dart';
import 'package:bicjr_app/views/pages/perfil/index.dart';
import 'package:bicjr_app/views/pages/postagens/index.dart';
import 'package:bicjr_app/views/pages/questoes_comentadas/index.dart';
import 'package:bicjr_app/views/pages/tela_inicial/index.dart';
import 'package:bicjr_app/views/pages/testes.dart';
import 'package:bicjr_app/views/pages/video_aulas/index.dart';

abstract class AppRoutes{
    static const String LOGIN = 'LOGIN';
    static const String TELAINICIAL = 'TELAINICIAL';
    static const String CADASTRO = 'CADASTRO';
    static const String HOME = 'HOME';
    static const String CONTEUDOS = 'CONTEUDOS';
    static const String PERFIL = 'PERFIL';
    static const String VIDEOAULAS = 'VIDEOAULAS';
    static const String POSTAGENS = 'POSTAGENS';
    static const String AJUDA = 'AJUDA';
    static const String QUESTOESCOMENTADAS = 'QUESTOESCOMENTADAS';
    // APAGAR
    static const String TESTES = 'TESTES';

    static final routes = {
      LOGIN: (context) => LoginPage(),
      TELAINICIAL: (context) => TelaInicial(),
      CADASTRO: (context)=> TelaCadastro(),
      HOME: (context)=> HomePage(),
      CONTEUDOS: (context)=> ContentsPage(),
      PERFIL: (context)=> PerfilUsuario(),
      VIDEOAULAS: (context)=> VideoAulas(),
      POSTAGENS: (context)=> PostagensPage(),
      AJUDA: (context)=> AjudaPage(),
      QUESTOESCOMENTADAS: (context)=> QuestoesComentadasPage(),
      // APAGAR
      TESTES: (context)=> TestesPage()
    };
}