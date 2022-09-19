<h1 align="center">Hi 👋, Welcome to my repository!!</h1>
<h3 align="center">A solution to implement python RESTful APIs using AWS lambda and API Gateway</h3>

<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://aws.amazon.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="40" height="40"/> </a> <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="40" height="40"/> </a> </p>


<h3 align="left">Our Target</h3>
<p align="left"> Implement a RESTful API which can download and upload image to S3 and store image details in DynamoDb Table. 
  This API endpoint should also be capable of retrieving details of all the uploaded image.
</p>

<h3 align="left">Architecture Diagram</h3>

![alt text](https://github.com/shekharsanatan92/python-lambda-apigateway/blob/master/ReadmeImages/python-lambda-ApiGateway.jpg?raw=true)

<h3 align="left">Implementation Details</h3>
Repository contains 4 cloudformation templates, each of which gets deployed as individual cloudformation stacks via **deploy.sh** script. Resources within these stacks refer to each other via CFN Export/Import capabilities. 
<h3 align="left">Running deploy.sh creates:</h3> 
<p align="left"> 1 DynamoDb table -> 'Images' - For storing Image information </p>
<p align="left"> 1 S3 bucket -> 'route-api-imagestore' - For storing images </p>
2 Lambdas -> 's3ImageDetails & s3ImageUpload' - **s3ImageDetails** retrieves all uploaded image details from dynamodb while **s3ImageUpload** performs the upload and update of image information to s3 and dynamodb respectively
<p align="left"> 1 API Gateway - To route traffic to respective lambdas based on the type of API call(Get/Post)</p>

<h3 align="left">API in Detail:</h3> 
Once the stacks are created, you can retrieve the API endpoint of the deployed API Gateway either via AWS Console or refer to **RootUrl** in the **Outputs** section of the **lambdaRestApi** cloudformation stack 
<h4 align="left">Calling Rest API</h4> 
You can use tools like Postman to send Get/Post requests to the API endpoint. **It accepts only JSON input**
<h4 align="left">~~Post Request Template~~</h4> 
<p align="left"> It takes two paramters in the form of json input</p>
<p align="left"> {
  "name": NAME OF THE IMAGE,
  "url": URL OF THE IMAGE TO DOWNLOAD
} </p>
<p align="left"> Example:</p>
<p align="left"> {
  "name": "road",
  "url": "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__480.jpg"
} </p>

![alt text](https://github.com/shekharsanatan92/python-lambda-apigateway/blob/master/ReadmeImages/PostRequest.png?raw=true)


<h4 align="left">~~Get Request Template~~</h4> 
<p align="left"> It doesn't require any input paramters </p>
<p align="left"> Example:</p>

![alt text](https://github.com/shekharsanatan92/python-lambda-apigateway/blob/master/ReadmeImages/GetRequest.png?raw=true)

<h4 align="left">You can run destroy.sh to clear off the stacks post activity.</h4>
