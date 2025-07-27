FROM gradle:8-jdk17

ARG WORKDIR_NAME
WORKDIR /${WORKDIR_NAME}

# Copy source code (only once at image build time)
COPY src/ src/

# RUN mkdir -p build && \
#     chown -R gradle:gradle src build && \
#     chmod -R u+rwX,g+rwX,o=rX src build

# RUN chown -R gradle:gradle src build && \ <--- Will fail as build is not created inside Dockerfile; use above.
#     chmod -R u+rwX,g+rwX,o=rX src build

# To have Env Variable : WORKDIR_NAME also reflect in container
ENV WORKDIR_NAME=${WORKDIR_NAME}

# USER gradle

# ENV GRADLE_USER_HOME=/cache
CMD ["bash"]



