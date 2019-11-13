import numpy as np
from keras.models import Sequential
from keras.layers import Dense

inputTest = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
outputTest = np.array([[0], [1], [1], [0]])
testTest = np.array([[0, 1], [1, 0], [1, 1], [0, 0]])

model = Sequential()
model.add(Dense(64, activation='relu', input_dim=2))
model.add(Dense(1,  activation='sigmoid'))

model.compile(optimizer='rmsprop',
              loss='binary_crossentropy',
              metrics=['binary_accuracy'])

model.fit(inputTest, outputTest, epochs=100, batch_size=1)

print('Test')
print(model.predict(testTest).round())
print('Input')
print(model.predict(inputTest).round())