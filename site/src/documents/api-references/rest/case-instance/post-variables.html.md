---

title: 'Update/Delete Case Instance Variables'
category: 'Case Instance'

keywords: 'post'

---


Updates or deletes the variables of a case instance. Please note: deletion precedes update.


Method
------

POST `/case-instance/{id}/variables`


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
    <td>The id of the case instance to set variables for.</td>
  </tr>
</table>


#### Request Body

<p>
  A json object with the following properties:
</p>
<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>modifications</td>
    <td>A json object containing variable key-value pairs. Each key is a variable name and each value a json variable value object.
    A variable value object has has the property <code>value</code>, which is the value to update, and <code>type</code>, which represents the type of the value. Valid types are String, Integer, Short, Long, Double and Date.</td>
  </tr>
  <tr>
    <td>deletions</td>
    <td>An array of <code>String</code> keys of variables to be deleted.</td>
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
    <td>The variable value or type is invalid, for example if the value could not be parsed to an Integer value or the passed variable type is not supported. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
  <tr>
    <td>500</td>
    <td>application/json</td>
    <td>Update or delete could not be executed, for example because the case instance does not exist.</td>
  </tr>
</table>

Example
-------

#### Request

POST `/case-instance/aCaseInstanceId/variables`

Request body:

    {
      "modifications":
        {
          "aVariable":
            {
              "value": "aValue"
            },
          "anotherVariable":
            {
              "value": 42
            }
        },
      "deletions":
        [
          "aThirdVariable",
          "FourthVariable"
        ]
    }

#### Response

Status 204. No content.