import numpy as np
from sklearn.datasets import load_iris


def softmax(inputs):
    return np.exp(inputs) / np.sum(np.exp(inputs), 1)[:, None]


def construct_net(in_dim, out_dim, hidden_dim=20):
    bound1 = np.sqrt(6.0 / (in_dim + hidden_dim))
    W1 = np.random.uniform(-bound1, bound1, size=[in_dim, hidden_dim])
    b1 = np.zeros(20)
    bound2 = np.sqrt(6.0 / (hidden_dim + out_dim))
    W2 = np.random.uniform(-bound2, bound2, size=[hidden_dim, out_dim])
    b2 = np.zeros(3)
    return [W1, b1, W2, b2]


def propagate(batch_X, batch_y, params):
    # one-hot label
    labels = np.zeros((len(batch_X), 3))
    for i in range(len(batch_y)):
        labels[i][batch_y[i]] = 1

    # forward
    W1, b1, W2, b2 = params
    h1 = np.dot(batch_X, W1) + b1
    a1 = np.copy(h1)
    a1[a1 < 0.0] = 0.0
    h2 = np.dot(a1, W2) + b2
    p = softmax(h2)

    # NLL loss
    loss = np.mean(-np.sum(labels * np.log(p), 1))

    # backward
    dl_dh2 = p - labels  # [batch, 3]
    dl_dW2 = np.dot(a1.T, dl_dh2)
    dl_db2 = np.sum(dl_dh2, 0)
    dl_da1 = np.dot(dl_dh2, W2.T)
    da1_dh1 = (h1 > 0).astype(float)
    dl_dh1 = dl_da1 * da1_dh1
    dl_dW1 = np.dot(batch_X.T, dl_dh1)
    dl_db1 = np.sum(dl_dh1, 0)
    return p, loss, [dl_dW1, dl_db1, dl_dW2, dl_db2]


def main():
    # prepare dataset
    iris = load_iris()
    dataset = iris.data
    dataset -= np.mean(dataset)
    dataset /= np.std(dataset)
    data_size = len(dataset)
    test_size = int(0.2 * data_size)
    test_idxs = np.random.randint(0, data_size, test_size)
    train_idxs = np.array([i for i in range(data_size) if i not in test_idxs])
    train_X = dataset[train_idxs]
    train_y = iris.target[train_idxs]
    test_X = dataset[test_idxs]
    test_y = iris.target[test_idxs]

    params = construct_net(4, 3)

    # train
    batch_size = 16
    leanring_rate = 0.003
    running_loss = 0
    for step in range(1000):
        batch_idx = np.random.randint(0, len(train_X), size=batch_size)
        batch_X = train_X[batch_idx]
        batch_y = train_y[batch_idx]
        _, loss, grads = propagate(batch_X, batch_y, params)
        if running_loss:
            running_loss = 0.9 * running_loss + 0.1 * loss
        else:
            running_loss = loss
        # update params
        for i in range(len(params)):
            params[i] -= leanring_rate * grads[i]

        if step % 50 == 0:
            print(step, running_loss)

    # evaluate
    predict, eval_loss, _ = propagate(test_X, test_y, params)
    predict = np.argmax(predict, 1)
    count = 0.0
    for i in range(test_size):
        if predict[i] == test_y[i]:
            count += 1.0
    print(eval_loss)
    print(count / test_size)


if __name__ == '__main__':
    main()
