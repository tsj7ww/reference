# create data schema - md table or json formats

# md table
def EDA_MD(df,f_out,n=100):
    """
    df: Pandas DataFrame
    f_out: path + name of output file
    n: number of sample rows to include
    """
    import math

    name = os.path.basename(f_out).split('.')[0]
    lb = '\n'
    lblb = '\n\n'
    sample = math.ceil(n/2)

    # columns & types
    content = '# EDA - {} Files {}'.format(os.path.basename(name).upper(),lblb)
    content+= f'#### Column Name [IDX] -  Dtype (Head / Tail){lb}'
    dtypes = df.dtypes.to_dict()
    head = df.head(1).T.iloc[:,0].to_list() # to_dict() - head.get(j)
    tail = df.tail(1).T.iloc[:,0].to_list() # to_dict() - tail.get(j)

    for i,j in enumerate(df.columns):
        content+='- **{}** [{}] - {} ({} / {}){}'.format(j, i, dtypes.get(j), head[i], tail[i], lb)

    # html
    content+='{}#### Head / Tail [n={}] Sample {}'.format(lb+lblb,n,lblb)
    content+=(df.head(sample).append(df.tail(sample)).to_html(None,index=True,header=True))

    with open(f_out,'w') as f:
        f.write(content)

# json
def EDA_JSON(df):
    """
    df: Pandas DataFrame
    """
    cols = []
    col = {
        'name': None,
        'index': None,
        'dtype': None,
        'head': None,
        'tail': None,
    }

    dtypes = df.dtypes.to_dict()
    head = df.head(1).T.iloc[:,0].to_list() # to_dict() - head.get(j)
    tail = df.tail(1).T.iloc[:,0].to_list() # to_dict() - tail.get(j)

    for i,j in enumerate(df.columns):
        c = col
        c['name'] = j
        c['index'] = i
        c['dtype'] = dtypes.get(j)
        c['head'] = head[i]
        c['tail'] = tail[i
        cols.append(c)

    return cols
