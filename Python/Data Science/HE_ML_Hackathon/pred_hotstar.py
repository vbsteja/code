import pandas as pd
from sklearn.ensemble import RandomForestClassifier

df_train = pd.read_json("~/Documents/dataset/hotstar/train_data.json")
df_test = pd.read_json("~/Documents/dataset/hotstar/test_data.json")

df_train.head()

def pred_hotstar():
    import pandas as pd
    from sklearn.ensemble import RandomForestClassifier

    df_train = pd.read_json("~/Documents/dataset/hotstar/train_data.json")
    df_test = pd.read_json("~/Documents/dataset/hotstar/test_data.json")

    df_train.head()
