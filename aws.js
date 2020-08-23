const AWS = require('aws-sdk')
require('dotenv').config()

const credentials = {
   accessKeyId: process.env.AWS_ACCESS_KEY_ID,
   secretAccessKey: process.env.AWS_SECRET_KEY,
}

const useLocal = process.env.NODE_ENV !== 'production'

const bucketName = process.env.AWS_BUCKET_NAME

const s3client = new AWS.S3({
   credentials,
   /**
    * When working locally, we'll use the Localstack endpoints. This is the one for S3.
    * A full list of endpoints for each service can be found in the Localstack docs.
    */
   endpoint: useLocal ? 'http://localhost:4572' : undefined,
   /**
     * Including this option gets localstack to more closely match the defaults for
     * live S3. If you omit this, you will need to add the bucketName to the `Key`
     * property in the upload function below.
     *
     * see: https://github.com/localstack/localstack/issues/1180
     */
   s3ForcePathStyle: true,
})


const uploadFile = async (data, fileName) =>
   new Promise((resolve) => {
      s3client.upload(
         {
            Bucket: bucketName,
            Key: fileName,
            Body: data,
         },
         (err, response) => {
            if (err) throw err
            resolve(response)
         },
      )
   })

module.exports = uploadFile