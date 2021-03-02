#########################
### INSPECTING OBJECT ###
#########################
import inspect
test = pd.DataFrame(None)
vars(test) # ???
dir(test) # methods & attriutes
inspect.getfullargspec(test.groupby)
