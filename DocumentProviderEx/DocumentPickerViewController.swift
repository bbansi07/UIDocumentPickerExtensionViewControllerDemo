//
//  DocumentPickerViewController.swift
//  DocumentProviderEx
//
//  Created by Bansi bhatt on 12/10/17.
//
//

import UIKit

class DocumentPickerViewController: UIDocumentPickerExtensionViewController {
    var fileCoordinator: NSFileCoordinator = {
        let fileCoordinator = NSFileCoordinator()
        // fileCoordinator.purposeIdentifier = self.providerIdentifier
        return fileCoordinator
    }()
    var url : URL? = nil
    let appGroupIdentifier = "group.com.demo.test.DocumentExtension"
    
    @IBAction func openDocument(_ sender: AnyObject?) {
        
        url = Bundle.main.url(forResource: "entry-points", withExtension: "txt")
        //Bundle.main.path(forResource: "entry-points", ofType: "txt")!
        let documentURL = self.documentStorageURL!.appendingPathComponent("entry-points.txt")
        print("document url is \(documentURL)")
        // TODO: if you do not have a corresponding file provider, you must ensure that the URL returned here is backed by a file
        
        //  FileManager.default.copyItem(atPath: URL(fileURLWithPath:url!.absoluteString.replacingOccurrences(of: "file://", with: "")), toPath:destinationURL)
        var destinationURL = documentURL//self.appGroupContainerURL()?.appendingPathComponent("entry-points.txt")  //NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        do {
            if FileManager.default.fileExists(atPath: documentURL.absoluteString.replacingOccurrences(of: "file://", with: "")){
                try?  FileManager.default.removeItem(at: destinationURL)
                
            }
            
            try FileManager.default.copyItem(at: (self.url!), to: documentURL)
            self.dismissGrantingAccess(to: documentURL)
            
        } catch {
            print("error copying file ")
            print(error.localizedDescription)
            return
        }
    }
    
    func appGroupContainerURL() -> URL? {
        // 1
        let fileManager = FileManager.default
        guard let groupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier) else {
            return nil
        }
        
        let storagePathUrl = groupURL.appendingPathComponent("File Provider Storage")
        let storagePath = storagePathUrl.path
        // 2
        if !fileManager.fileExists(atPath: storagePath) {
            do {
                try fileManager.createDirectory(atPath: storagePath,
                                                withIntermediateDirectories: false,
                                                attributes: nil)
            } catch let error {
                print("error creating filepath: \(error)")
                return nil
            }
        }
        // 3
        return storagePathUrl
    }
    
    override func prepareForPresentation(in mode: UIDocumentPickerMode) {
        // TODO: present a view controller appropriate for picker mode here
        
        switch mode {
        case .exportToService:
            //code for export document
            break
        case .moveToService:
            //code for move document
            break
        case .open:
            //Show file list
            break
        case .import:
            //Show file list
            break
        default:
            break
        }
    }
    
    
}
//delegates
/*extension DocumentPickerViewController : UITableViewDataSource{
 
 }*/
