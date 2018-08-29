Imports System.Data.SqlClient
Imports System.Net
Imports System.Web.Http

Namespace Controllers
    Public Class CalendarController
        Inherits ApiController

        ' GET: api/Calendar
        Public Function GetValues() As IEnumerable(Of String)
            Dim eventsList = New List(Of String)

            Dim connectionString = ConfigurationManager.ConnectionStrings("test_db").ConnectionString
            Dim conn = New SqlConnection(connectionString)

            Dim sqlCmd = New SqlCommand("exec displayActiveEvents", conn)

            conn.Open()

            Dim reader = sqlCmd.ExecuteReader()
            While reader.Read()
                eventsList.Add(String.Format("Event: {0}, Year: {1}", reader(1), reader(2)))
            End While

            conn.Close()

            Return eventsList
        End Function

    End Class
End Namespace