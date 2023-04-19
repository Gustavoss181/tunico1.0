import 'dart:io';
import 'package:bicjr_app/data/models/postagem_model.dart';
import 'package:bicjr_app/data/models/usuario_model.dart';
import 'package:bicjr_app/data/providers/mobile_pdf.dart';
import 'package:bicjr_app/views/components/foto_convert.dart';
import 'package:bicjr_app/views/pages/perfil_outros_usuarios/index.dart';
import 'package:flutter/material.dart';

class CardPost extends StatefulWidget {
  UsuarioModel user;
  PostModel post;
  String currentUserId;
  Function deletar;
  Function expandirImagem;

  CardPost({
    this.user,
    this.post,
    this.currentUserId,
    this.deletar,
    this.expandirImagem
  });
  @override
  _CardPostState createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  String pathPDF = "";

  String mostrarData(data){
    Duration dife = DateTime.now().difference(data);
    if (dife.inMinutes < 1)
      return 'Agora';
    if (dife.inHours < 1)
      return 'Há ${dife.inMinutes} minutos atrás';
    if (dife.inDays < 1)
      return 'Há ${dife.inHours} horas atrás';
    if (dife.inDays == 1)
      return 'Ontem';
    return 'Há ${dife.inDays} dias atrás';
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color.fromARGB(200, 255, 107, 107))
        ),
        elevation: 0,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if(widget.user != null)
                  Navigator.push(
                    context,
                    MaterialPageRoute( 
                      builder: (context) => new OutroUsuario(widget.user)
                    )
                  );
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 30,
                      height: 30,
                      child: ClipOval(
                        child: FotoConvert().retornaFoto(widget.user == null ? '' : widget.user.foto)
                      )
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user == null ? 'Usuário anônimo' : widget.user.nome,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        Text(
                          mostrarData(widget.post.data.toDate()),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  // APAGAR POST
                  if(widget.currentUserId == widget.user.id &&
                    DateTime.now().difference(widget.post.data.toDate()).inMinutes < 10)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => widget.deletar()
                      ),
                    )
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.texto,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (widget.post.filePath != null && widget.post.filePath != '')
              if (widget.post.filePath.split('?').first.split('.').last == "pdf")
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.indigo[100]),
                        ),
                        child: FlatButton.icon(
                          onPressed: () async {
                            await LaunchFile.createFileFromPdfUrl(widget.post.filePath)
                                .then((f) => setState(() {
                                      if (f is File) pathPDF = f.path;
                                    }));
                            LaunchFile.launchPDF(context, "Visualizador de PDF",
                                pathPDF, widget.post.filePath);
                          },
                          icon: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.blue[600],
                          ),
                          label: Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              widget.post.filePath.split('2F').last.substring(12).split('.').first,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[600],
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => widget.expandirImagem(),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    // height: 200,
                    child: FotoConvert().retornaFoto(widget.post.filePath),
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }
}