import io
import sys
import matplotlib.pyplot as plt

import networkx as nx
from flask import Flask, Response

app = Flask(__name__, instance_relative_config=True)

@app.route('/')
def helloworld():
    G = nx.random_geometric_graph(8,2)
    pos = nx.spring_layout(G)
    nx.draw(G,pos)

    output = io.BytesIO()
    plt.title("Hello from ScientistPythonServer")
    plt.savefig(output)

    return Response(output.getvalue(), mimetype='image/png')


if __name__ == '__main__':
    _port=6080
    if len(sys.argv)>1:_port = sys.argv[1]

    if "debug" in sys.argv:
        app.run(host="0.0.0.0", port=_port, debug=True)
    else:
        app.run(host="0.0.0.0", port=_port, debug=False)

