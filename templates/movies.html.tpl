{% include "header.html" %}
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Title</th>
                <th scope="col">Year</th>
            </tr>
        </thead>
        <tbody>
            {% for movie in movies_data %}
                <tr>
                    <th scope="row">{{movie[0]}}</th>
                    <td>{{movie[1]}}</td>
                    <td>{{movie[2]}}</td>
                </tr>
            {% endfor %} 
        </tbody>
    </table>
{% include "footer.html" %}
