# SEALab Totternary Testing: 11-7-2019
On 11-5 we were successfully able to get the devices outputting ranges into the debug setup in the lab. Today, I have returned to the lab to test the devices again to see if those results are reliably reproduceable with the current version of the code.

## Test 1
### Parameters
* Nodes 26 and 29
* Code was **not** reflashed onto the devices
* J-Link debuggers were connected to node 26
* J-Link `S/N: 260...` to the nRF, `S/N 269...` to the STM
* Nodes were turned off and back on since the last day of testing (11-5-2019)

### Debug output
* [STM](test1/t1_STM_output_26.txt)
* [nRF](test1/t1_nRF_output_26.txt)

### Observations
The ranges were correctly recorded with reasonable values. **Successful short test**

---

## Test 2
### Parameters
* Nodes 26 and 29
* Code was **not** reflashed onto the devices
* J-Link debuggers were connected to node 29
* J-Link `S/N: 260...` to the nRF, `S/N 269...` to the STM
* Nodes were turned off and back on since the previous test

### Debug output
* [STM](test2/t2_STM_output_29.txt)
* [nRF](test2/t2_nRF_output_29.txt)

### Observations
The ranges were correctly recorded with reasonable values. **Successful short test**

---

## Test 3
On successful test of the new code on two nodes, we have decided to try two completely different nodes that have been freshly flashed.
### Parameters
* Nodes 27 and 2A
* Code **was** reflashed onto the devices. Used J-Link `S/N: 269...`
* J-Link debuggers were connected to node 2A
* J-Link `S/N: 260...` to the nRF, `S/N 269...` to the STM
* *Note: I instinctively did two runs on this one because the first one failed with disconnection issues.*
### Debug output
#### First run
* [STM](test3/first_run/t3r1_STM_output_2A.txt)
* [nRF](test3/first_run/t3r1_nRF_output_2A.txt)
#### Second run
* [STM](test3/second_run/t3r2_STM_output_2A.txt)
* [nRF](test3/second_run/t3r2_nRF_output_2A.txt)
### Observations
#### First run
This one seemed to connect, fail, disconnect, reconnect, repeat. **Failed short test**

#### Second run
This one seemed to connect but constantly range unreasonably large values. **Failed short test**

---

## Test 4
### Parameters
* Nodes 27 and 2A
* Code was **not** reflashed onto the devices since test 3.
* J-Link debuggers were connected to node 27
* J-Link `S/N: 260...` to the nRF, `S/N 269...` to the STM
### Debug output
* [STM](test4/t4_STM_output_27.txt)
* [nRF](test4/t4_nRF_output_27.txt)
### Observation
Similar results to test 3 run 2. **Failed short test**

---

## Next Steps
One of the two nodes used in tests 3 and 4 might be functioning but the failed one could be messing up the whole output. So I think a good next step would be to test node 27 with 26 then 29. Then test node 2A with 26 then 29. Just to see if either of those are functioning.