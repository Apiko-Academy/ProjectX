@Images = new Mongo.Collection 'images'

imageStore = new FS.Store.S3 'images',
  bucket: 'images-grid'
  accessKeyId: 'AKIAI5VQS7Q4XRISWWGA'
  secretAccessKey: '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'

Images = new FS.Collection 'images',
  stores: [imageStore]
  filter:
    maxSize: 16*1024  # in bytes
    allow:
      contentTypes: ['image/*']  # allow only images in this FS.Collection
    transformWrite: (fileObj, readStream, writeStream) ->
      stream.stream = gm readStream, fileObj.name()
      stream.resize '512', '512'
      stream.pipe writeStream
