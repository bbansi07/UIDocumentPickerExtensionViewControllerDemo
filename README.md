# UIDocumentPickerExtensionViewControllerDemo
UIDocumentPickerExtensionViewController demo for uploading document from any place to anywhere
*Document provider extension

- The document provider extension is a new type of extension introduced in iOS8. Actually, it’s a combination of 2 separate extensions:

1. Document picker
2. File provider


- The document picker is an UI component that can be presented when another application launches an iCloud file picker.

- The file provider is a non-UI component that coordinates reading/writing into a file and manages access to a file between host and containing application.

- The document picker allows you to pick a file and to do one of 4 supported operations:

1. Export
2. Import
3. Open
4. Move

- At last calls dismissGrantingAccessToURL(_:)  and it pass in the destURL. This will give the third-party app the new URL. At this point the third-party app can either delete its copy of the file (for MoveToService) or keep its copy (for ExportToService).


- If after calling dismissGrantingAccessToURL(_:) method file is of zero byte one change needs to  fix that issue. Open  info.plist file(extensionFileprovider) >> change "FileProvider" in NSExtensionPrincipalClass
