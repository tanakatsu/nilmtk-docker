from nilmtk import DataSet

ds = DataSet('../dataset/test/random.h5')
elec = ds.buildings[1].elec

print(elec)
