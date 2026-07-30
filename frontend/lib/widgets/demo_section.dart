import 'package:flutter/material.dart';
import 'package:marketing_eff/api_service.dart';

class DemoSection extends StatefulWidget {
  const DemoSection({super.key});

  @override
  State<DemoSection> createState() => _DemoSectionState();
}

class _DemoSectionState extends State<DemoSection> {
  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? result;

  // Controllers
  final saleController = TextEditingController();
  final xadController = TextEditingController();
  final xsgaController = TextEditingController();
  final xrdController = TextEditingController();

  final atController = TextEditingController();
  final niController = TextEditingController();
  final rectController = TextEditingController();
  final cheController = TextEditingController();

  final dlcController = TextEditingController();
  final dlttController = TextEditingController();
  final ceqController = TextEditingController();

  final ppentController = TextEditingController();
  final capxController = TextEditingController();
  final empController = TextEditingController();
  final invtController = TextEditingController();
  final cogsController = TextEditingController();
  final oancfController = TextEditingController();

  final prccController = TextEditingController();
  final cshoController = TextEditingController();

  @override
  void dispose() {
    for (final c in [
      saleController,
      xadController,
      xsgaController,
      xrdController,
      atController,
      niController,
      rectController,
      cheController,
      dlcController,
      dlttController,
      ceqController,
      ppentController,
      capxController,
      empController,
      invtController,
      cogsController,
      oancfController,
      prccController,
      cshoController,
    ]) {
      c.dispose();
    }

    super.dispose();
  }

  Widget input(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget section(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Future<void> analyzeCompany() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await ApiService.analyze({
        "sale": double.tryParse(saleController.text) ?? 0,
        "xad": double.tryParse(xadController.text) ?? 0,
        "xsga": double.tryParse(xsgaController.text) ?? 0,
        "xrd": double.tryParse(xrdController.text) ?? 0,
        "at": double.tryParse(atController.text) ?? 0,
        "ni": double.tryParse(niController.text) ?? 0,
        "rect": double.tryParse(rectController.text) ?? 0,
        "che": double.tryParse(cheController.text) ?? 0,
        "dlc": double.tryParse(dlcController.text) ?? 0,
        "dltt": double.tryParse(dlttController.text) ?? 0,
        "ppent": double.tryParse(ppentController.text) ?? 0,
        "capx": double.tryParse(capxController.text) ?? 0,
        "ceq": double.tryParse(ceqController.text) ?? 0,
        "emp": double.tryParse(empController.text) ?? 0,
        "invt": double.tryParse(invtController.text) ?? 0,
        "cogs": double.tryParse(cogsController.text) ?? 0,
        "oancf": double.tryParse(oancfController.text) ?? 0,
        "prcc_f": double.tryParse(prccController.text) ?? 0,
        "csho": double.tryParse(cshoController.text) ?? 0,
      });
      print(response);
      // debugPrint(response.toString());

      setState(() {
        result = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

Widget metric(String title, dynamic value) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Color(0xff64748B),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff0F172A),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
  static const Map<String, String> labels = {
  "xad": "Advertising Expenses",
  "xsga": "SG&A Expenses",
  "xrd": "Research & Development",
  "rect": "Accounts Receivable",
  "che": "Cash & Cash Equivalents",
  "capx": "Capital Expenditure",
  "emp": "Number of Employees",
  "invt": "Inventory",
  "cogs": "Cost of Goods Sold",
  "oancf": "Operating Cash Flow",
};
  @override
  
  Widget build(BuildContext context) {
    final recommendations = (result?["recommended_values"] as Map?) ?? {};

    return Container(
      color: const Color(0xffF8FAFC),
      padding: const EdgeInsets.all(30),
      child: Column(
        
        children: [
          const Text(
            "Try Demo",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F172A),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Enter your company's financial and marketing data to receive optimization recommendations.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff64748B),
              height: 1.6,
            ),
          ),

          const SizedBox(height: 50),
          section("Revenue & Marketing", [
            input("Annual Sales", saleController),
            input("Advertising", xadController),
            input("SG&A", xsgaController),
            input("R&D", xrdController),
          ]),

          section("Company Financials", [
            input("Assets", atController),
            input("Net Income", niController),
            input("Receivable", rectController),
            input("Cash", cheController),
          ]),

          section("Capital Structure", [
            input("Current Debt", dlcController),
            input("Long-term Debt", dlttController),
            input("Equity", ceqController),
          ]),

          section("Operations", [
            input("PP&E", ppentController),
            input("CapEx", capxController),
            input("Employees", empController),
            input("Inventory", invtController),
            input("COGS", cogsController),
            input("Operating Cash Flow", oancfController),
          ]),

          section("Market", [
            input("Share Price", prccController),
            input("Shares Outstanding", cshoController),
          ]),

          const SizedBox(height: 30),

          SizedBox(
            width: 260,
            height: 55,
            child: ElevatedButton(
              onPressed: isLoading ? null : analyzeCompany,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Analyze Company"),
            ),
          ),

          if (errorMessage != null) ...[
            const SizedBox(height: 20),
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
          ],

          if (result != null) ...[
            const SizedBox(height: 40),

            Row(
              children: [
                metric("Current", result!["current_prediction"]),
                metric(
                  "Optimized",
                  result!["optimized_prediction"],
                
                ),
                metric(
                  "Improvement",
                  "${((result!["improvement_percent"] ?? 0) as num).toStringAsFixed(2)}%",
                
                ),
              ],
            ),

            const SizedBox(height: 35),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recommendations",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

  Card(
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: recommendations.entries.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [

              const Icon(
                Icons.auto_awesome,
                color: Color(0xff1E3A8A),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  labels[e.key] ?? e.key,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE8F5E9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  (e.value as num).toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  ),
),
          ],

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
