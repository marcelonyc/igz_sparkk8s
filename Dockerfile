FROM gcr.io/spark-operator/spark:v2.4.0
RUN rm $SPARK_HOME/jars/kubernetes-client-3.0.0.jar
ADD https://repo1.maven.org/maven2/io/fabric8/kubernetes-client/4.4.2/kubernetes-client-4.4.2.jar $SPARK_HOME/jars
