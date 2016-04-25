//
//  PhotoManager.swift
//  GooglyPuff
//
//  Created by Bjørn Olav Ruud on 06.08.14.
//  Copyright (c) 2014 raywenderlich.com. All rights reserved.
//

import Foundation

/// Notification when new photo instances are added
let PhotoManagerAddedContentNotification = "com.raywenderlich.GooglyPuff.PhotoManagerAddedContent"
/// Notification when content updates (i.e. Download finishes)
let PhotoManagerContentUpdateNotification = "com.raywenderlich.GooglyPuff.PhotoManagerContentUpdate"

typealias PhotoProcessingProgressClosure = (completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (error: NSError?) -> Void

private let _sharedManager = PhotoManager()

class PhotoManager {
  class var sharedManager: PhotoManager {
    return _sharedManager
  }

  private var _photos: [Photo] = []
  var photos: [Photo] {
    var photosCopy: [Photo]!
    dispatch_sync(concurrentPhotoQueue) { // 1
      photosCopy = self._photos // 2
    }
    return photosCopy
  }

  private let concurrentPhotoQueue = dispatch_queue_create(
    "com.raywenderlich.GooglyPuff.photoQueue", DISPATCH_QUEUE_CONCURRENT)

  func addPhoto(photo: Photo) {
    dispatch_barrier_async(concurrentPhotoQueue) { // 1
      self._photos.append(photo) // 2
      dispatch_async(GlobalMainQueue) { // 3
        self.postContentAddedNotification()
      }
    }
  }

  func downloadPhotosWithCompletion(completion: BatchPhotoDownloadingCompletionClosure?) {
    // 1
    var storedError: NSError!
    let downloadGroup = dispatch_group_create()
    
    for address in [OverlyAttachedGirlfriendURLString,
                    SuccessKidURLString,
                    LotsOfFacesURLString]
    {
      let url = NSURL(string: address)
      dispatch_group_enter(downloadGroup)
      let photo = DownloadPhoto(url: url!) {
        image, error in
        if let error = error {
          storedError = error
        }
        dispatch_group_leave(downloadGroup)
      }
      PhotoManager.sharedManager.addPhoto(photo)
    }
    
    dispatch_group_notify(downloadGroup, GlobalMainQueue) { // 2
      if let completion = completion {
        completion(error: storedError)
      }
    }
  }

  private func postContentAddedNotification() {
    NSNotificationCenter.defaultCenter().postNotificationName(PhotoManagerAddedContentNotification, object: nil)
  }
}
