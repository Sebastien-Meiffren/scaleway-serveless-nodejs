# Scaleway Function Serverless Nodejs14
Based on the information found : https://github.com/scaleway/scaleway-functions-runtimes/tree/master/runtimes/node14

💀💀 DO NOT USE THIS IN PROD. ONLY MEANT FOR TESTING / DEV PURPOSES 💀💀
## Install
Make sure to have installed : 
- Nodejs (tested with 16.x)
- Docker (if you want to run it in a docker)
To install the system : 
- ``npm install``
- ``npm run build``
- ``npm run start``

⚠️I know there are some errors while building but the dist/index.js file is correct. I don't know if this is because scaleway uses node14 and I node16
## Build your functions
Create a new file in ``./handlers/src/foo.js``
You file should contain at the very least
```
module.exports.foohandle = (event, context, callback) => {
    return "OK"
}
```

## Tests your function
⚠️Make sure to restart the start process

To test your new function, query the app :   
``http://localhost:8081?handlerName=<FUNCTION NAME>&handlerPath=../handlers/src/<FUNCTION PATH>``

With our foo example, the query would be :  
``http://localhost:8081?handlerName=foohandle&handlerPath=../handlers/src/foo``


With the default handler :  
``http://localhost:8081?handlerName=handle&handlerPath=../handlers/src/handler``

## Deploy your functions
⚠️There is a second package.json file in the ``handlers`` directory to avoid packaging all dependencies for the project to run ⚠️

You need to configure the serverless.yml file : 
- NAMESPACE > namespace of your project.
- TOKEN FROM YOUR API > your API key https://www.scaleway.com/en/docs/console/my-project/how-to/generate-api-key/
- ID OF YOUR PROJECT > you project ID, can be found in the Scaleway homepage

After, just need to run ``serverless deploy``