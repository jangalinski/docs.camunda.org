---

title: 'Post Local Task Variable (Binary)'
category: 'Task'

keywords: 'post update set local binary variable'

---

Sets the serialized value for a binary variable or the Base64 encoded value for a file variable.

Method
------

POST `/task/{id}/localVariables/{varId}/data`


Parameters
----------

#### Path Parameters

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>The id of the task to set the variable for.</td>
  </tr>
  <tr>
    <td>varId</td>
    <td>The name of the variable to set.</td>
  </tr>
</table>

#### Request Body

For binary variables a multipart form submit with the following parts:

<table class="table table-striped">
  <tr>
    <th>Form Part Name</th>
    <th>Content Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>data</td>
    <td>application/octet-stream</td>
    <td>The binary data to be set.</td>
  </tr>
  <tr>
    <td>data</td>
    <td>application/json</td>
    <td>
      <p><b>Deprecated</b>: This only works if the REST API is aware of the involved Java classes.</p>
      <p>A JSON representation of a serialized Java Object. Form part <code>type</code> (see below) must be provided.</p>
    </td>
  </tr>
  <tr>
    <td>type</td>
    <td>text/plain</td>
    <td>
      <p><b>Deprecated</b>: This only works if the REST API is aware of the involved Java classes.</p>
      <p>The canonical java type name of the variable to be set. Example: <code>foo.bar.Customer</code>. If this part is provided, <code>data</code> must be a JSON object which can be converted into an instance of the provided class. The content type of the <code>data</code> part must be <code>application/json</code> in that case (see above).</p>
    </td>
  </tr>
</table>

For file variables a multipart form submit with the following parts:

<table class="table table-striped">
  <tr>
    <th>Form Part Name</th>
    <th>Content Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>filename</td>
    <td>text/plain</td>
    <td>The name of the file. This is <b>not</b> the variable name but the name that will be used when downloading the file again.</td>
  </tr>
  <tr>
    <td>data</td>
    <td>text/plain</td>
    <td><b>Optional</b>: The binary data encoded as Base64 string to be set.</td>
  </tr>
  <tr>
    <td>mimetype</td>
    <td>text/plain</td>
    <td><b>Optional</b>: The mime type of the file that is being uploaded.</td>
  </tr>
  <tr>
    <td>mimetype</td>
    <td>text/plain</td>
    <td><b>Optional</b>: The encoding of the file that is being uploaded.</td>
  </tr>
</table>


Result
------

This method returns no content.


Response codes
--------------  

<table class="table table-striped">
  <tr>
    <th>Code</th>
    <th>Media type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>204</td>
    <td></td>
    <td>Request successful.</td>
  </tr>
  <tr>
    <td>400</td>
    <td>application/json</td>
    <td>The variable value or type is invalid, for example if the value could not be parsed to an Integer value or the passed variable type is not supported. Also, if no filename is set. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
  <tr>
    <td>500</td>
    <td>application/json</td>
    <td>Variable name is null. Task id is null or does not exist. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
</table>


Example
-------

#### Request

(1) Post binary content of a byte array variable:

POST `/task/aTaskId/localVariables/aVarName/data`

```
------------------------------354ddb6baeff
Content-Disposition: form-data; name="data"; filename="image.png"
Content-Type: application/octet-stream
Content-Transfer-Encoding: binary

<<Byte Stream ommitted>>
------------------------------354ddb6baeff--
```

(2) Post the JSON serialization of a Java Class (**deprecated**):

POST `/task/aTaskId/localVariables/aVarName/data`

```
------------------------------1e838f8f632a
Content-Disposition: form-data; name="type"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

java.util.ArrayList<java.lang.Object>
------------------------------1e838f8f632a
Content-Disposition: form-data; name="data"
Content-Type: application/json; charset=US-ASCII
Content-Transfer-Encoding: 8bit

["foo","bar"]
------------------------------1e838f8f632a--
```

(3) Post a text file:

POST `/case-instance/aCaseInstanceId/variables/aVarName/data`

```  
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="data"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

TG9yZW0gaXBzdW0=
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="filename"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

myFile.txt
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="mimetype"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

text/plain
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="encoding"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

UTF-8
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y--
```

#### Response

Status 204. No content.
