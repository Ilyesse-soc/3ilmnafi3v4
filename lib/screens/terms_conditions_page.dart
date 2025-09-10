import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🎨 Arrière-plan marocain avec fresque
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/title.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.95),
                  BlendMode.lighten,
                ),
              ),
            ),
          ),

          // 📃 Contenu avec effet scroll
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        children: [
                    const Center(
                      child: Text(
                        "Notre objectif",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C8B6C), // Bleu marocain
                          
                          
                          decorationColor: Color(0xFF1C8B6C),
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "« Élever la parole d’Allah »",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "السّلام عليكم ورحمة الله وبركاته",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "3ilm Nafi3 est une application conçue, par la grâce d’Allah ﷻ, pour te permettre d’apprendre et surtout de mettre en pratique la science utile tirée de l’islam authentique : le Coran, la Sunna du Prophète ﷺ, selon la compréhension des pieux prédécesseurs.",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "Une fonctionnalité de partage de vidéos a également été mise en place pour faciliter la transmission du savoir et espérer une sadaqa jariya (صدقة جارية) in shâ’ Allah.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "🕋 Qu’Allah nous facilite et agrée nos œuvres.",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const Text(
                      "Amin !",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 20),

                    const Center(
                      child: Text(
                        "Conditions",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C8B6C),
                          
                          decorationColor: Color(0xFF1C8B6C),
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      "Conditions de partage des vidéos :\n\n"
                      "🟢 Pour que votre vidéo soit validée :\n"
                      "• Le savant et le(s) thème(s) doivent correspondre à la vidéo\n"
                      "• La vidéo doit durer 3 minutes maximum\n"
                      "• Vous devez attendre la validation d’une vidéo avant d’en envoyer une autre\n\n"
                      "🔴 Une vidéo sera refusée si :\n"
                      "• Elle contient le visage d’un savant n’autorisant pas sa diffusion\n"
                      "• Le savant ou le thème choisi ne correspond pas au contenu\n"
                      "• La miniature est inappropriée",
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 20),
                    /*const Text(
                      "📚 Thème(s) disponibles :",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),*/
                    const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.share, color: Colors.white),
                          label: Text("Partager l’application", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1C8B6C), // vert marocain
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            // Utilise share_plus
                            // https://apps.apple.com/fr/app/3ilmnafi3/id6742595997
                            // https://play.google.com/store/apps/details?id=com.digilocx._3ilm_nafi3
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => Container(
                                padding: EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Partager l’application', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 12),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.ios_share, color: Colors.white),
                                      label: Text('App Store (iOS)', style: TextStyle(color: Colors.orange)),
                                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1C8B6C)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Share.share('https://apps.apple.com/fr/app/3ilmnafi3/id6742595997');
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.android, color: Colors.white),
                                      label: Text('Play Store (Android)', style: TextStyle(color: Colors.orange)),
                                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1C8B6C)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Share.share('https://play.google.com/store/apps/details?id=com.digilocx._3ilm_nafi3');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
