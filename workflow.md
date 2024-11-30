# WorkFlow of the cource design

## Work to be done

```mermaid
stateDiagram
    state Par1{
        [*] --> FFTs : Basic
        [*] --> WT : Extention
        FFTs --> Mag : Extention
        InitCommit!
        Analysis
    }

    Par1 --> Filter : For Par2
    Par1 --> Extentions456 : offer help

    state Par2{
        Filter --> ... : You can design many filters e.g. IIR FIR or anything else
        [*] --> Extentions456 : Commit
        Design
    }

    state Par3{
        Diagrams --> Report
        Analysis --> Report
        Docs
    }

    Par3 --> Extentions456 : offer help
    Par2 --> Par4
    Par1 --> Par4

    state Par4{
       Coding
       Integration
    }
    Par4 --> Par3
    Par4 --> Extentions456 : offer help

```

### Tips

> Par1 for these algorithms

> Par2 for these designs and should be responsible for the Extentions

> Par3(Flexible) for docs, Better with Latex or anything else you like
>
> > For Par3: If you also want to do tasks above (Par1 Par2) You can participate in.Just discuss with Par4 to share your doc work to be done with Par4.

> Par4 refers to all these works and do coding for the implements for algorithms and designs
