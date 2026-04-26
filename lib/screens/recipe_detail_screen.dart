import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganache_lab/models/recipe.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:material_symbols_icons/symbols.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Création du contrôleur d'animation pour une rotation infinie
    _controller = AnimationController(
      duration: const Duration(
        seconds: 20,
      ), // Rotation lente (20 secondes par tour)
      vsync: this,
    )..repeat(); // Répétition infinie
  }

  @override
  void dispose() {
    _controller.dispose(); // Ne pas oublier de libérer les ressources
    super.dispose();
  }

  // --- UTILS ---

  String _formatDate(DateTime dt) {
    return "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  }

  void _showExportSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ExportHubSheet(recipe: widget.recipe),
    );
  }

  // --- WIDGETS ---

  Widget _buildSectionHeader(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    final color = Theme.of(context).colorScheme.primary;
    return Row(
      children: [
        Icon(icon, color: color, fill: 1),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: color),
        ),
      ],
    );
  }

  Widget _buildDataRow(
    String name,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 15)),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.title)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showExportSheet(context),
        label: const Text("Exporter la recette"),
        icon: const Icon(Symbols.output),
        backgroundColor: const Color(0xFFEB8C36),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header accentué avec grand cookie animé
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // RotationTransition anime tout ce qui est à l'intérieur
                      RotationTransition(
                        turns: _controller,
                        child: SvgPicture.asset(
                          'assets/svg/cookie12.svg',
                          height: 180,
                          width: 180,
                          colorFilter: ColorFilter.mode(
                            colorScheme.primaryContainer,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      // L'icône au centre ne tourne pas (car hors de la RotationTransition)
                      Icon(
                        Symbols.humidity_high,
                        size: 100,
                        color: colorScheme.primary,
                        fill: 1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.recipe.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Créée le ${_formatDate(widget.recipe.createdAt)}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Ingrédients
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: Column(
                children: [
                  _buildSectionHeader(
                    context,
                    icon: Symbols.receipt_long,
                    title: "Ingrédients",
                  ),
                  const SizedBox(height: 15),
                  if (widget.recipe.chocolateWeight > 0)
                    _buildDataRow(
                      "Chocolat (${widget.recipe.chocolateType})",
                      "${widget.recipe.chocolateWeight.toStringAsFixed(1)} g",
                      isBold: true,
                    ),
                  if (widget.recipe.milkChocolateWeight > 0)
                    _buildDataRow(
                      "Chocolat Lait",
                      "${widget.recipe.milkChocolateWeight.toStringAsFixed(1)} g",
                      isBold: true,
                    ),
                  const Divider(),
                  _buildDataRow(
                    "Crème Liquide 35%",
                    "${widget.recipe.creamWeight.toStringAsFixed(1)} g",
                  ),
                  const Divider(),
                  _buildDataRow(
                    "Matière Sucrante",
                    "${widget.recipe.sugarWeight.toStringAsFixed(1)} g",
                  ),
                  const Divider(),
                  _buildDataRow(
                    "Beurre Laitier 82%",
                    "${widget.recipe.butterWeight.toStringAsFixed(1)} g",
                  ),
                  const Divider(thickness: 2),
                  _buildDataRow(
                    "Poids Total",
                    "${widget.recipe.totalWeight.toStringAsFixed(1)} g",
                    color: colorScheme.primary,
                    isBold: true,
                  ),
                ],
              ),
            ),

            // Résumé des paramètres
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: Column(
                children: [
                  _buildSectionHeader(
                    context,
                    icon: Symbols.settings_suggest,
                    title: "Résumé des paramètres",
                  ),
                  const SizedBox(height: 15),
                  _buildDataRow("Application", widget.recipe.application),
                  const Divider(),
                  _buildDataRow(
                    "Chocolat utilisé",
                    widget.recipe.chocolateType,
                  ),
                  const Divider(),
                  _buildDataRow(
                    "Température",
                    "${widget.recipe.temperature.toStringAsFixed(0)} °C",
                  ),
                ],
              ),
            ),

            // Données d'équilibrage
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: Column(
                children: [
                  _buildSectionHeader(
                    context,
                    icon: Symbols.water_drop,
                    title: "Données d'équilibrage",
                  ),
                  const SizedBox(height: 15),
                  _buildDataRow(
                    "Matière Grasse Totale",
                    "${(widget.recipe.fatPercentage * 100).toStringAsFixed(1)} %",
                  ),
                  _buildDataRow(
                    "Sucre Total",
                    "${(widget.recipe.sugarPercentage * 100).toStringAsFixed(1)} %",
                  ),
                  _buildDataRow(
                    "Extrait Sec Total",
                    "${(widget.recipe.solidsPercentage * 100).toStringAsFixed(1)} %",
                  ),
                  _buildDataRow(
                    "Eau (Humidité)",
                    "${(widget.recipe.waterPercentage * 100).toStringAsFixed(1)} %",
                  ),
                  const Divider(),
                  _buildDataRow(
                    "Pouvoir Sucrant (POD)",
                    widget.recipe.sweeteningPower.toStringAsFixed(1),
                  ),
                  _buildDataRow(
                    "Activité de l'eau (Aw)",
                    widget.recipe.awValue.toStringAsFixed(3),
                    color:
                        widget.recipe.awValue > 0.85
                            ? Colors.red
                            : Colors.green,
                    isBold: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
