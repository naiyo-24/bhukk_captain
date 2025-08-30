
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
	const SignupScreen({super.key});

	@override
	State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
	final PageController _pageController = PageController();
	int _currentPage = 0;
	final AuthController controller = Get.find<AuthController>();

	// Controllers for text fields
	final TextEditingController nameController = TextEditingController();
	final TextEditingController phoneController = TextEditingController();
	final TextEditingController emailController = TextEditingController();
	PlatformFile? drivingLicense;
	final TextEditingController aadharController = TextEditingController();
	PlatformFile? aadharFile;
	final TextEditingController panController = TextEditingController();
	PlatformFile? panFile;
	final TextEditingController vehicleRegController = TextEditingController();
	PlatformFile? vehicleRegFile;
	PlatformFile? vehicleRACFile;
	final TextEditingController bankAccountController = TextEditingController();
	final TextEditingController accountHolderController = TextEditingController();
	final TextEditingController ifscController = TextEditingController();
	PlatformFile? bankPassbookFile;

	void _pickFile(Function(PlatformFile) onPicked) async {
		FilePickerResult? result = await FilePicker.platform.pickFiles();
		if (result != null && result.files.isNotEmpty) {
			onPicked(result.files.first);
			setState(() {});
		}
	}

	List<Widget> get _slides => [
		// Slide 1: Name, Phone, Email, Driving License
		Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				TextField(
					controller: nameController,
					decoration: const InputDecoration(labelText: 'Full Name'),
				),
				const SizedBox(height: 16),
				TextField(
					controller: phoneController,
					keyboardType: TextInputType.phone,
					decoration: const InputDecoration(labelText: 'Phone Number'),
				),
				const SizedBox(height: 16),
				TextField(
					controller: emailController,
					keyboardType: TextInputType.emailAddress,
					decoration: const InputDecoration(labelText: 'Email'),
				),
				const SizedBox(height: 16),
				ElevatedButton.icon(
					icon: const Icon(Icons.upload_file),
					label: Text(drivingLicense == null ? 'Upload Driving License' : 'Driving License Uploaded'),
					onPressed: () => _pickFile((file) => drivingLicense = file),
				),
			],
		),
		// Slide 2: Aadhar, Aadhar Upload, PAN, PAN Upload
		Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				TextField(
					controller: aadharController,
					decoration: const InputDecoration(labelText: 'Aadhar Number'),
				),
				const SizedBox(height: 16),
				ElevatedButton.icon(
					icon: const Icon(Icons.upload_file),
					label: Text(aadharFile == null ? 'Upload Aadhar' : 'Aadhar Uploaded'),
					onPressed: () => _pickFile((file) => aadharFile = file),
				),
				const SizedBox(height: 16),
				TextField(
					controller: panController,
					decoration: const InputDecoration(labelText: 'PAN Number'),
				),
				const SizedBox(height: 16),
				ElevatedButton.icon(
					icon: const Icon(Icons.upload_file),
					label: Text(panFile == null ? 'Upload PAN' : 'PAN Uploaded'),
					onPressed: () => _pickFile((file) => panFile = file),
				),
			],
		),
		// Slide 3: Vehicle Reg No, Vehicle Reg Upload, RAC Upload, Bank Account No
		Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				TextField(
					controller: vehicleRegController,
					decoration: const InputDecoration(labelText: 'Vehicle Registration Number'),
				),
				const SizedBox(height: 16),
				ElevatedButton.icon(
					icon: const Icon(Icons.upload_file),
					label: Text(vehicleRegFile == null ? 'Upload Vehicle Registration' : 'Vehicle Registration Uploaded'),
					onPressed: () => _pickFile((file) => vehicleRegFile = file),
				),
				const SizedBox(height: 16),
				ElevatedButton.icon(
					icon: const Icon(Icons.upload_file),
					label: Text(vehicleRACFile == null ? 'Upload RAC Document' : 'RAC Document Uploaded'),
					onPressed: () => _pickFile((file) => vehicleRACFile = file),
				),
				const SizedBox(height: 16),
				TextField(
					controller: bankAccountController,
					decoration: const InputDecoration(labelText: 'Bank Account Number'),
				),
			],
		),
		// Slide 4: Account Holder Name, IFSC, Bank Passbook Upload, Submit
		Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				TextField(
					controller: accountHolderController,
					decoration: const InputDecoration(labelText: 'Account Holder Name'),
				),
				const SizedBox(height: 16),
				TextField(
					controller: ifscController,
					decoration: const InputDecoration(labelText: 'IFSC Code'),
				),
				const SizedBox(height: 16),
				ElevatedButton.icon(
					icon: const Icon(Icons.upload_file),
					label: Text(bankPassbookFile == null ? 'Upload Bank Passbook Front Page' : 'Bank Passbook Uploaded'),
					onPressed: () => _pickFile((file) => bankPassbookFile = file),
				),
				const SizedBox(height: 24),
				Obx(() => controller.isLoading.value
						? const Center(child: CircularProgressIndicator())
						: ElevatedButton(
								onPressed: _submit,
								child: const Text('Submit'),
							)),
			],
		),
	];

	void _submit() async {
		// Add validation and call controller.signup (to be implemented)
		controller.isLoading.value = true;
		final success = await controller.signup(
			name: nameController.text.trim(),
			phone: phoneController.text.trim(),
			email: emailController.text.trim(),
			drivingLicense: drivingLicense,
			aadhar: aadharController.text.trim(),
			aadharFile: aadharFile,
			pan: panController.text.trim(),
			panFile: panFile,
			vehicleReg: vehicleRegController.text.trim(),
			vehicleRegFile: vehicleRegFile,
			vehicleRACFile: vehicleRACFile,
			bankAccount: bankAccountController.text.trim(),
			accountHolder: accountHolderController.text.trim(),
			ifsc: ifscController.text.trim(),
			bankPassbookFile: bankPassbookFile,
		);
		controller.isLoading.value = false;
		if (success) {
			Get.snackbar('Signup Successful', 'Your account has been created.');
			Get.offAllNamed('/login');
		} else {
			Get.snackbar('Signup Failed', controller.errorMessage.value, backgroundColor: Colors.red.shade100);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Sign Up')),
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(24.0),
					child: Column(
						children: [
							Expanded(
								child: PageView(
									controller: _pageController,
									physics: const NeverScrollableScrollPhysics(),
									children: _slides,
								),
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [
									if (_currentPage > 0)
										ElevatedButton(
											onPressed: () {
												setState(() {
													_currentPage--;
													_pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 300), curve: Curves.ease);
												});
											},
											child: const Text('Back'),
										),
									if (_currentPage < _slides.length - 1)
										ElevatedButton(
											onPressed: () {
												setState(() {
													_currentPage++;
													_pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 300), curve: Curves.ease);
												});
											},
											child: const Text('Next'),
										),
								],
							),
						],
					),
				),
			),
		);
	}
}
