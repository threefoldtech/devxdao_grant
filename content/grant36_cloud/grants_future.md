## Future Grants

>TODO: fix

### Integration in Casperlabs Blockchain Backend

- show how seamless pruning can be implemented in POC using the blockchain engine
- this is a serious job and will require quite some effort to make sure it happens in the safest way and gets well tested.
- this will require low level integration so that the data paths dont change to much.
- Use the Blockchain layer to also prove authenticity of the pruning storage layer (is an extra check, not strictly needed, but might give extra confidence to community).

### Redundant write path for pruning DB

Use e.g. tendermint to write in redundant way to the backend.

### Production Readyness & Testing

Testing this new pruning layer in all its facets on performance and reliability level.

### Master-Slave Solution for pruning DB

- Make Pruning DB Redundant (active-active or active-passive)
- Show how there is never a reliability issue, create good test cases to show this redundancy.